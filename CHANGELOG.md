# Changelog

All notable changes to this project will be documented in this file.

## [v10.1.0](https://github.com/voxpupuli/voxpupuli-test/tree/v10.1.0) (2025-06-09)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v10.0.1...v10.1.0)

**Implemented enhancements:**

- Allow for new version of puppet-strings [\#163](https://github.com/voxpupuli/voxpupuli-test/pull/163) ([ghoneycutt](https://github.com/ghoneycutt))
- validate:ruby: Validate Ruby tasks [\#159](https://github.com/voxpupuli/voxpupuli-test/pull/159) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- validate rake task: Add missing rake dependency [\#160](https://github.com/voxpupuli/voxpupuli-test/pull/160) ([bastelfreak](https://github.com/bastelfreak))

## [v10.0.1](https://github.com/voxpupuli/voxpupuli-test/tree/v10.0.1) (2025-05-28)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v10.0.0...v10.0.1)

**Fixed bugs:**

- Correctly call sh\(\) when validating Ruby files [\#157](https://github.com/voxpupuli/voxpupuli-test/pull/157) ([ekohl](https://github.com/ekohl))

## [v10.0.0](https://github.com/voxpupuli/voxpupuli-test/tree/v10.0.0) (2025-05-28)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v9.2.1...v10.0.0)

**Breaking changes:**

- Drop rspec-puppet-utils [\#154](https://github.com/voxpupuli/voxpupuli-test/pull/154) ([bastelfreak](https://github.com/bastelfreak))
- Replace PSH with puppet\_fixtures [\#153](https://github.com/voxpupuli/voxpupuli-test/pull/153) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- parallel\_tests: Allow 5.x [\#155](https://github.com/voxpupuli/voxpupuli-test/pull/155) ([bastelfreak](https://github.com/bastelfreak))

## [v9.2.1](https://github.com/voxpupuli/voxpupuli-test/tree/v9.2.1) (2025-04-09)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v9.2.0...v9.2.1)

**Fixed bugs:**

- Add syslog gem as dependency [\#151](https://github.com/voxpupuli/voxpupuli-test/pull/151) ([bastelfreak](https://github.com/bastelfreak))

## [v9.2.0](https://github.com/voxpupuli/voxpupuli-test/tree/v9.2.0) (2024-10-08)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v9.1.0...v9.2.0)

**Implemented enhancements:**

- puppetlabs\_spec\_helper: Require 8.x [\#149](https://github.com/voxpupuli/voxpupuli-test/pull/149) ([bastelfreak](https://github.com/bastelfreak))

## [v9.1.0](https://github.com/voxpupuli/voxpupuli-test/tree/v9.1.0) (2024-09-06)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v9.0.0...v9.1.0)

**Implemented enhancements:**

- rspec-puppet: Require 5.x [\#146](https://github.com/voxpupuli/voxpupuli-test/pull/146) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- README.md: Document how to use voxpupuli-test [\#147](https://github.com/voxpupuli/voxpupuli-test/pull/147) ([bastelfreak](https://github.com/bastelfreak))

## [v9.0.0](https://github.com/voxpupuli/voxpupuli-test/tree/v9.0.0) (2024-07-08)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v8.1.0...v9.0.0)

**Breaking changes:**

- require rspec-puppet-facts 5.x; drop legacy facts support [\#132](https://github.com/voxpupuli/voxpupuli-test/pull/132) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- custom facts: Honour stringified facts [\#144](https://github.com/voxpupuli/voxpupuli-test/pull/144) ([bastelfreak](https://github.com/bastelfreak))

## [v8.1.0](https://github.com/voxpupuli/voxpupuli-test/tree/v8.1.0) (2024-07-05)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v8.0.0...v8.1.0)

**Implemented enhancements:**

- feat\(check:trailing\_whitespace\):  collect all problems, report and then exit [\#141](https://github.com/voxpupuli/voxpupuli-test/pull/141) ([rwaffen](https://github.com/rwaffen))
- Add rubocop config [\#130](https://github.com/voxpupuli/voxpupuli-test/pull/130) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Document the trailing\_whitespace rake task in the README [\#142](https://github.com/voxpupuli/voxpupuli-test/pull/142) ([rwaffen](https://github.com/rwaffen))
- Remove redundant mock\_with default to rspec [\#138](https://github.com/voxpupuli/voxpupuli-test/pull/138) ([ekohl](https://github.com/ekohl))
- Merge duplicate branches in service\_provider fact [\#137](https://github.com/voxpupuli/voxpupuli-test/pull/137) ([ekohl](https://github.com/ekohl))

## [v8.0.0](https://github.com/voxpupuli/voxpupuli-test/tree/v8.0.0) (2024-06-12)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v7.2.0...v8.0.0)

**Breaking changes:**

- rspec-puppet-facts: Require 4.x; add custom facts as strings  [\#135](https://github.com/voxpupuli/voxpupuli-test/pull/135) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- Use our spec\_helper for tests [\#133](https://github.com/voxpupuli/voxpupuli-test/pull/133) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- gem build: include README.md+LICENSE [\#129](https://github.com/voxpupuli/voxpupuli-test/pull/129) ([bastelfreak](https://github.com/bastelfreak))

## [v7.2.0](https://github.com/voxpupuli/voxpupuli-test/tree/v7.2.0) (2024-05-23)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v7.1.0...v7.2.0)

**Implemented enhancements:**

- Add Ruby 3.3 to CI matrix [\#128](https://github.com/voxpupuli/voxpupuli-test/pull/128) ([bastelfreak](https://github.com/bastelfreak))
- puppetlabs\_spec\_helper: Require 7.3 [\#126](https://github.com/voxpupuli/voxpupuli-test/pull/126) ([bastelfreak](https://github.com/bastelfreak))

## [v7.1.0](https://github.com/voxpupuli/voxpupuli-test/tree/v7.1.0) (2023-11-23)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v7.0.2...v7.1.0)

**Implemented enhancements:**

- puppetlabs\_spec\_helper: Require 7.x [\#122](https://github.com/voxpupuli/voxpupuli-test/pull/122) ([bastelfreak](https://github.com/bastelfreak))

## [v7.0.2](https://github.com/voxpupuli/voxpupuli-test/tree/v7.0.2) (2023-10-12)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v7.0.1...v7.0.2)

**Fixed bugs:**

- dont set trusted\_node\_data/trusted\_server\_facts [\#120](https://github.com/voxpupuli/voxpupuli-test/pull/120) ([bastelfreak](https://github.com/bastelfreak))

## [v7.0.1](https://github.com/voxpupuli/voxpupuli-test/tree/v7.0.1) (2023-10-11)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v7.0.0...v7.0.1)

**Merged pull requests:**

- rspec-puppet: Update 3.x to 4.x & metadata-json-lint: Update 3.x to 4.x [\#118](https://github.com/voxpupuli/voxpupuli-test/pull/118) ([bastelfreak](https://github.com/bastelfreak))

## [v7.0.0](https://github.com/voxpupuli/voxpupuli-test/tree/v7.0.0) (2023-08-17)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v6.0.0...v7.0.0)

**Breaking changes:**

- Rubocop: Update 1.28.2-\>1.50.0; requires Ruby 2.6 [\#115](https://github.com/voxpupuli/voxpupuli-test/pull/115) ([bastelfreak](https://github.com/bastelfreak))
- always mock trusted/server facts [\#114](https://github.com/voxpupuli/voxpupuli-test/pull/114) ([bastelfreak](https://github.com/bastelfreak))
- Rubocop: Update 1.22.3-\>1.28.3 [\#91](https://github.com/voxpupuli/voxpupuli-test/pull/91) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Gemfile: Allow Puppet 8 [\#116](https://github.com/voxpupuli/voxpupuli-test/pull/116) ([bastelfreak](https://github.com/bastelfreak))

## [v6.0.0](https://github.com/voxpupuli/voxpupuli-test/tree/v6.0.0) (2023-05-05)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v5.7.0...v6.0.0)

**Breaking changes:**

- puppet-strings: Require 4.x [\#107](https://github.com/voxpupuli/voxpupuli-test/pull/107) ([bastelfreak](https://github.com/bastelfreak))
- voxpupuli-puppet-lint-plugins: Require 5.x [\#106](https://github.com/voxpupuli/voxpupuli-test/pull/106) ([bastelfreak](https://github.com/bastelfreak))
- Require Ruby 2.7 or newer, drop Puppet 6 support [\#105](https://github.com/voxpupuli/voxpupuli-test/pull/105) ([bastelfreak](https://github.com/bastelfreak))

**Implemented enhancements:**

- Build gems with verbosity and strictness [\#109](https://github.com/voxpupuli/voxpupuli-test/pull/109) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- GCG: Add faraday-retry dep [\#110](https://github.com/voxpupuli/voxpupuli-test/pull/110) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Gemfile: Default to Puppet 7 [\#111](https://github.com/voxpupuli/voxpupuli-test/pull/111) ([bastelfreak](https://github.com/bastelfreak))
- gem dependencies: Add upper version limits [\#108](https://github.com/voxpupuli/voxpupuli-test/pull/108) ([bastelfreak](https://github.com/bastelfreak))

## [v5.7.0](https://github.com/voxpupuli/voxpupuli-test/tree/v5.7.0) (2023-04-28)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v5.6.0...v5.7.0)

**Implemented enhancements:**

- Add Puppet 8 to CI matrix [\#103](https://github.com/voxpupuli/voxpupuli-test/pull/103) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- CI: Add a dummy task github rules can depend on [\#102](https://github.com/voxpupuli/voxpupuli-test/pull/102) ([bastelfreak](https://github.com/bastelfreak))
- Bump actions/checkout from 2 to 3 [\#96](https://github.com/voxpupuli/voxpupuli-test/pull/96) ([dependabot[bot]](https://github.com/apps/dependabot))
- CI: Run on merges to master [\#95](https://github.com/voxpupuli/voxpupuli-test/pull/95) ([bastelfreak](https://github.com/bastelfreak))
- dependabot: check for github actions and gems [\#94](https://github.com/voxpupuli/voxpupuli-test/pull/94) ([bastelfreak](https://github.com/bastelfreak))
- Remove use of legacy facts [\#93](https://github.com/voxpupuli/voxpupuli-test/pull/93) ([alexjfisher](https://github.com/alexjfisher))

## [v5.6.0](https://github.com/voxpupuli/voxpupuli-test/tree/v5.6.0) (2023-03-01)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v5.5.0...v5.6.0)

**Implemented enhancements:**

- voxpupuli-puppet-lint-plugins: Require 4.x [\#89](https://github.com/voxpupuli/voxpupuli-test/pull/89) ([bastelfreak](https://github.com/bastelfreak))

## [v5.5.0](https://github.com/voxpupuli/voxpupuli-test/tree/v5.5.0) (2023-02-15)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/5.4.1...v5.5.0)

**Implemented enhancements:**

- Enhance CI with more Ruby/Puppet versions [\#85](https://github.com/voxpupuli/voxpupuli-test/pull/85) ([bastelfreak](https://github.com/bastelfreak))
- require PSH 5.x, require puppet-strings [\#84](https://github.com/voxpupuli/voxpupuli-test/pull/84) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Correct description in README [\#83](https://github.com/voxpupuli/voxpupuli-test/pull/83) ([ekohl](https://github.com/ekohl))

## [5.4.1](https://github.com/voxpupuli/voxpupuli-test/tree/5.4.1) (2022-07-18)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v5.4.0...5.4.1)

**Fixed bugs:**

- Correct systemd custom fact implementation [\#81](https://github.com/voxpupuli/voxpupuli-test/pull/81) ([ekohl](https://github.com/ekohl))
- Handle puppet/systemd like camptocamp/systemd [\#80](https://github.com/voxpupuli/voxpupuli-test/pull/80) ([ekohl](https://github.com/ekohl))

## [v5.4.0](https://github.com/voxpupuli/voxpupuli-test/tree/v5.4.0) (2022-05-24)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v5.3.1...v5.4.0)

**Implemented enhancements:**

- Add Ruby 3.1 to CI, build gem during CI [\#79](https://github.com/voxpupuli/voxpupuli-test/pull/79) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- Layout/HashAlignment: Allow both key and table styles [\#77](https://github.com/voxpupuli/voxpupuli-test/pull/77) ([root-expert](https://github.com/root-expert))

## [v5.3.1](https://github.com/voxpupuli/voxpupuli-test/tree/v5.3.1) (2022-03-28)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v5.3.0...v5.3.1)

**Fixed bugs:**

- rubocop: Naming/PredicateName: Fix AllowedMethods default is\_a? [\#75](https://github.com/voxpupuli/voxpupuli-test/pull/75) ([root-expert](https://github.com/root-expert))
- rubocop: Naming/PredicateName: Add is\_to\_s to AllowedMethods [\#74](https://github.com/voxpupuli/voxpupuli-test/pull/74) ([root-expert](https://github.com/root-expert))

## [v5.3.0](https://github.com/voxpupuli/voxpupuli-test/tree/v5.3.0) (2022-03-12)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v5.2.0...v5.3.0)

**Implemented enhancements:**

- rubocop: Naming/MethodParameterName: Add common short parameters names to AllowedNames [\#71](https://github.com/voxpupuli/voxpupuli-test/pull/71) ([root-expert](https://github.com/root-expert))
- rubocop: Disable Style/OptionalBooleanParameter [\#70](https://github.com/voxpupuli/voxpupuli-test/pull/70) ([root-expert](https://github.com/root-expert))

## [v5.2.0](https://github.com/voxpupuli/voxpupuli-test/tree/v5.2.0) (2021-12-17)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v5.1.1...v5.2.0)

**Merged pull requests:**

- Rubocop: Disable ImplicitSubject [\#68](https://github.com/voxpupuli/voxpupuli-test/pull/68) ([bastelfreak](https://github.com/bastelfreak))

## [v5.1.1](https://github.com/voxpupuli/voxpupuli-test/tree/v5.1.1) (2021-11-30)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v5.1.0...v5.1.1)

**Merged pull requests:**

- Disable `Lint/BooleanSymbol` [\#66](https://github.com/voxpupuli/voxpupuli-test/pull/66) ([alexjfisher](https://github.com/alexjfisher))

## [v5.1.0](https://github.com/voxpupuli/voxpupuli-test/tree/v5.1.0) (2021-11-27)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v5.0.0...v5.1.0)

**Implemented enhancements:**

- Set facter implementation to rspec [\#62](https://github.com/voxpupuli/voxpupuli-test/pull/62) ([ekohl](https://github.com/ekohl))

## [v5.0.0](https://github.com/voxpupuli/voxpupuli-test/tree/v5.0.0) (2021-11-26)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v4.1.0...v5.0.0)

**Breaking changes:**

- voxpupuli-puppet-lint-plugins: Require 3.x [\#63](https://github.com/voxpupuli/voxpupuli-test/pull/63) ([bastelfreak](https://github.com/bastelfreak))

## [v4.1.0](https://github.com/voxpupuli/voxpupuli-test/tree/v4.1.0) (2021-11-10)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v4.0.0...v4.1.0)

**Implemented enhancements:**

- rubocop-rspec: allow \>= 2.6 \< 3 [\#60](https://github.com/voxpupuli/voxpupuli-test/pull/60) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- puppet-lint: fail on warnings [\#59](https://github.com/voxpupuli/voxpupuli-test/pull/59) ([bastelfreak](https://github.com/bastelfreak))

## [v4.0.0](https://github.com/voxpupuli/voxpupuli-test/tree/v4.0.0) (2021-10-28)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v3.0.0...v4.0.0)

**Breaking changes:**

- Use latest rubocop and target ruby 2.5 [\#40](https://github.com/voxpupuli/voxpupuli-test/pull/40) ([alexjfisher](https://github.com/alexjfisher))

## [v3.0.0](https://github.com/voxpupuli/voxpupuli-test/tree/v3.0.0) (2021-10-02)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v2.6.0...v3.0.0)

**Breaking changes:**

- Require voxpupuli-puppet-lint-plugins 2.x instead of 1.x [\#56](https://github.com/voxpupuli/voxpupuli-test/pull/56) ([bastelfreak](https://github.com/bastelfreak))

## [v2.6.0](https://github.com/voxpupuli/voxpupuli-test/tree/v2.6.0) (2021-08-26)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v2.5.0...v2.6.0)

**Implemented enhancements:**

- Use voxpupuli-puppet-lint-plugins [\#52](https://github.com/voxpupuli/voxpupuli-test/pull/52) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- Revert "Add metadata\_json\_deps + rake task" [\#54](https://github.com/voxpupuli/voxpupuli-test/pull/54) ([bastelfreak](https://github.com/bastelfreak))

## [v2.5.0](https://github.com/voxpupuli/voxpupuli-test/tree/v2.5.0) (2021-08-13)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v2.4.0...v2.5.0)

**Implemented enhancements:**

- Add metadata\_json\_deps + rake task [\#47](https://github.com/voxpupuli/voxpupuli-test/pull/47) ([bastelfreak](https://github.com/bastelfreak))

**Fixed bugs:**

- Append `check:trailing_whitespace` rake task to `check` and not `release_checks` [\#48](https://github.com/voxpupuli/voxpupuli-test/pull/48) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- require metadata-json-lint 3 or newer/metadata\_json\_deps 0.3.0 or newer [\#50](https://github.com/voxpupuli/voxpupuli-test/pull/50) ([bastelfreak](https://github.com/bastelfreak))
- Use default facter version from rspec-puppet-facts [\#49](https://github.com/voxpupuli/voxpupuli-test/pull/49) ([ekohl](https://github.com/ekohl))
- Depend on puppet-lint \>= 2.5.0 [\#45](https://github.com/voxpupuli/voxpupuli-test/pull/45) ([bastelfreak](https://github.com/bastelfreak))

## [v2.4.0](https://github.com/voxpupuli/voxpupuli-test/tree/v2.4.0) (2021-07-21)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v2.3.0...v2.4.0)

**Implemented enhancements:**

- Remove fact memoization [\#30](https://github.com/voxpupuli/voxpupuli-test/pull/30) ([ekohl](https://github.com/ekohl))

## [v2.3.0](https://github.com/voxpupuli/voxpupuli-test/tree/v2.3.0) (2021-07-13)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v2.2.0...v2.3.0)

**Implemented enhancements:**

- add puppet-lint-optional\_default-check [\#41](https://github.com/voxpupuli/voxpupuli-test/pull/41) ([bastelfreak](https://github.com/bastelfreak))

## [v2.2.0](https://github.com/voxpupuli/voxpupuli-test/tree/v2.2.0) (2020-12-15)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v2.1.2...v2.2.0)

**Implemented enhancements:**

- Disable Style/TrailingCommaInArguments [\#36](https://github.com/voxpupuli/voxpupuli-test/pull/36) ([traylenator](https://github.com/traylenator))
- Add mocked custom facts based on metadata [\#19](https://github.com/voxpupuli/voxpupuli-test/pull/19) ([ekohl](https://github.com/ekohl))

**Merged pull requests:**

- Convert from Travis to Github Actions [\#37](https://github.com/voxpupuli/voxpupuli-test/pull/37) ([ekohl](https://github.com/ekohl))

## [v2.1.2](https://github.com/voxpupuli/voxpupuli-test/tree/v2.1.2) (2020-11-10)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v2.1.1...v2.1.2)

**Merged pull requests:**

- Revert "Pin `rspec-expectations`" [\#34](https://github.com/voxpupuli/voxpupuli-test/pull/34) ([alexjfisher](https://github.com/alexjfisher))

## [v2.1.1](https://github.com/voxpupuli/voxpupuli-test/tree/v2.1.1) (2020-11-02)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v2.1.0...v2.1.1)

**Merged pull requests:**

- Pin `rspec-expectations` [\#32](https://github.com/voxpupuli/voxpupuli-test/pull/32) ([alexjfisher](https://github.com/alexjfisher))
- Disable Style/TrailingCommaInLiteral [\#31](https://github.com/voxpupuli/voxpupuli-test/pull/31) ([ghoneycutt](https://github.com/ghoneycutt))

## [v2.1.0](https://github.com/voxpupuli/voxpupuli-test/tree/v2.1.0) (2020-08-18)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v2.0.0...v2.1.0)

**Implemented enhancements:**

- Add a Rubocop config [\#28](https://github.com/voxpupuli/voxpupuli-test/pull/28) ([ekohl](https://github.com/ekohl))

## [v2.0.0](https://github.com/voxpupuli/voxpupuli-test/tree/v2.0.0) (2020-07-22)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v1.5.0...v2.0.0)

**Breaking changes:**

- Add puppet-lint-file\_ensure-check [\#24](https://github.com/voxpupuli/voxpupuli-test/pull/24) ([bastelfreak](https://github.com/bastelfreak))
- add puppet-lint-manifest\_whitespace-check [\#22](https://github.com/voxpupuli/voxpupuli-test/pull/22) ([bastelfreak](https://github.com/bastelfreak))
- Add puppet-lint-strict\_indent-check [\#21](https://github.com/voxpupuli/voxpupuli-test/pull/21) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Update rubocop-rspec dependency [\#26](https://github.com/voxpupuli/voxpupuli-test/pull/26) ([alexjfisher](https://github.com/alexjfisher))

## [v1.5.0](https://github.com/voxpupuli/voxpupuli-test/tree/v1.5.0) (2020-06-27)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v1.4.0...v1.5.0)

**Merged pull requests:**

- depend on facterdb 1.4.0 for Ubuntu 20.04 facts [\#20](https://github.com/voxpupuli/voxpupuli-test/pull/20) ([bastelfreak](https://github.com/bastelfreak))

## [v1.4.0](https://github.com/voxpupuli/voxpupuli-test/tree/v1.4.0) (2020-04-24)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v1.3.0...v1.4.0)

**Implemented enhancements:**

- Require at least facterdb 1.3.0 for Debian 10 [\#17](https://github.com/voxpupuli/voxpupuli-test/pull/17) ([ekohl](https://github.com/ekohl))

## [v1.3.0](https://github.com/voxpupuli/voxpupuli-test/tree/v1.3.0) (2020-04-21)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v1.2.0...v1.3.0)

**Implemented enhancements:**

- Add override\_facts helper method [\#15](https://github.com/voxpupuli/voxpupuli-test/pull/15) ([ekohl](https://github.com/ekohl))

## [v1.2.0](https://github.com/voxpupuli/voxpupuli-test/tree/v1.2.0) (2020-04-14)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v1.1.0...v1.2.0)

**Merged pull requests:**

- Define a default task [\#12](https://github.com/voxpupuli/voxpupuli-test/pull/12) ([ekohl](https://github.com/ekohl))

## [v1.1.0](https://github.com/voxpupuli/voxpupuli-test/tree/v1.1.0) (2020-04-11)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v1.0.0...v1.1.0)

**Implemented enhancements:**

- Memoize rspec-puppet-facts [\#10](https://github.com/voxpupuli/voxpupuli-test/pull/10) ([ekohl](https://github.com/ekohl))
- add puppet-lint-resource\_reference\_syntax as dependency [\#9](https://github.com/voxpupuli/voxpupuli-test/pull/9) ([bastelfreak](https://github.com/bastelfreak))

## [v1.0.0](https://github.com/voxpupuli/voxpupuli-test/tree/v1.0.0) (2020-04-03)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v0.2.0...v1.0.0)

**Closed issues:**

- This project is now stable - release it as v1.0.0 [\#7](https://github.com/voxpupuli/voxpupuli-test/issues/7)

## [v0.2.0](https://github.com/voxpupuli/voxpupuli-test/tree/v0.2.0) (2020-02-11)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/v0.1.0...v0.2.0)

**Fixed bugs:**

- fix facter version detection [\#5](https://github.com/voxpupuli/voxpupuli-test/pull/5) ([bastelfreak](https://github.com/bastelfreak))

**Merged pull requests:**

- Make suggest\_facter\_version more robust and complete [\#4](https://github.com/voxpupuli/voxpupuli-test/pull/4) ([ekohl](https://github.com/ekohl))
- Determine correct facter version based on puppet [\#3](https://github.com/voxpupuli/voxpupuli-test/pull/3) ([bastelfreak](https://github.com/bastelfreak))
- Add Apache-2 license file / gemspec: fix file pattern / gitignore: ignore gem artifacts [\#2](https://github.com/voxpupuli/voxpupuli-test/pull/2) ([bastelfreak](https://github.com/bastelfreak))

## [v0.1.0](https://github.com/voxpupuli/voxpupuli-test/tree/v0.1.0) (2020-02-09)

[Full Changelog](https://github.com/voxpupuli/voxpupuli-test/compare/d1c16d6fb9733129f44f31fd5471760de35dddf8...v0.1.0)

**Merged pull requests:**

- release 0.1.0 [\#1](https://github.com/voxpupuli/voxpupuli-test/pull/1) ([bastelfreak](https://github.com/bastelfreak))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
