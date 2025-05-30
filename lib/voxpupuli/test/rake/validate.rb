# frozen_string_literal: true

require 'metadata-json-lint/rake_task'
require 'puppet-strings/tasks'
require 'rake' # provides `sh` method
require 'json-schema'

def task_schema
  {
    "$schema": "http://json-schema.org/draft-06/schema#",
    "title": "Puppet Task Metadata",
    "description": "The metadata format for Puppet Tasks",
    "type": "object",
    "properties": {
      "description": {
        "type": "string",
        "description": "A longer description(one paragraph) of how to use the task"
      },
      "puppet_task_version": {
        "type": "integer",
        "description": "The version of this spec used",
        "default": 1
      },
      "supports_noop": {
        "type": "boolean",
        "default": false,
        "description": "This task respects the '_noop' metaparam. If this false or absent the task runner will refuse to run this task if noop is specified."
      },
      "remote": {
        "type": "boolean",
        "default": false,
        "description": "This task is capable of operating on a remote target using connection information in the '_target' metaparam."
      },
      "input_method": {
        "type": "string",
        "enum": [
          "stdin",
          "environment",
          "both",
          "powershell"
        ],
        "description": "What input method should be used to pass params to the task"
      },
      "parameters": {
        "$ref": "#/definitions/paramsObject",
        "description": "An object mapping valid parameter names to corresponding json-schemas"
      },
      "implementations": {
        "type": "array",
        "items": {
          "type": "object",
          "required": [
            "name"
          ],
          "properties": {
            "name": {
              "type": "string",
              "description": "Name of task executable file"
            },
            "requirements": {
              "type": "array",
              "additionalItems": {
                "type": "string"
              },
              "description": "Features required on target to execute task"
            },
            "files": {
              "type": "array",
              "additionalItems": {
                "type": "string"
              },
              "description": "File resources required by task"
            }
          }
        },
        "description": "Rules for selecting implementation resources based on features available on target"
      },
      "files": {
        "type": "array",
        "items": {
          "type": "string"
        },
        "description": "Path to file resources saved in valid module directory to be provided to task"
      },
      "private": {
        "type": "boolean",
        "description": "Should this task appear by default in UI lists of tasks"
      },
      "extensions": {
        "type": "object",
        "description": "Task Runner specific metadata extensions",
        "items": {
          "type": "object"
        }
      },
      "identifiers": {
        "type": "object",
        "description": "An arbitrary map of key-value pairs without inherent, semantic meaning to a Task Runner"
      }
    },
    "definitions": {
      "parameterName": {
        "description": "Valid names for parameter keys",
        "type": "string",
        "pattern": "^[a-z][a-z0-9_]*$"
      },
      "paramsObject": {
        "type": "object",
        "description": "An object with restricted keys and enumData support",
        "propertyNames": {
          "$ref": "#/definitions/parameterName"
        },
        "additionalProperties": {
          "type": "object",
          "description": "Extend Normal JSON schema to require an object and describe 'enumData' to map enum values to descriptions",
          "properties": {
            "description": {
              "description": "A description of the parameter",
              "type": "string"
            },
            "type": {
              "description": "A puppet type string that describes a data type that will match the parameter value",
              "type": "string"
            },
            "sensitive": {
              "description": "Whether the task runner should treat the parameter value as sensitive",
              "type": "boolean",
              "default": false
            },
            "default": {
              "description": "The default value to pass to the task implementation if the parameter isn't provided"
            }
          }
        }
      }
    }
  }
end

def task_schema_validate(data)
  JSON::Validator.fully_validate(task_schema, data, { errors_as_objects: true }).map do |error|
    field = error[:fragment].split('/')[1]
    field = 'root' if field.nil? || field.empty?

    message = error[:message]
              .sub(/ in schema [\w-]+/, '') # remove schema UUID, not needed in output
              .sub(%r{'#/}, "'") # remove root #/ prefix from document paths
              .sub("property ''", 'file') # call the root #/ node the file

    { field: field, message: message }
  end
end
namespace :validate do
  desc 'Validate all .rb files'
  task :ruby do
    Dir['lib/**/*.rb', 'tasks/**/*.rb'].each do |lib_file|
      sh 'ruby', '-c', lib_file
    end
  end

  desc 'validate REFERENCE.md if it exists'
  task :strings do
    if File.exist?('REFERENCE.md')
      Rake::Task['strings:validate:reference'].invoke
    end
  end

  desc 'validate task metadata'
  task :task_metadata do
    messages = []
    Dir['tasks/**/*.json'].each do |metadata|
      begin
        parsed = JSON.parse(File.read(metadata))
      rescue Exception => e
        abort("Error: Unable to parse #{metadata}: #{e.exception}")
      end
      response = task_schema_validate(parsed)
      unless response.empty?
        messages << response.first.merge(file: metadata)
      end
    end
    pp messages
  end
end

# `syntax` will validate pp, hiera, erb, epp files
desc 'Check syntax of Ruby files and call :syntax and :metadata_lint'
task validate: ['validate:ruby', 'syntax', 'metadata_lint', 'validate:strings', 'validate:task_metadata']
