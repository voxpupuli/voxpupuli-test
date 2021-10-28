# Changelog

All notable changes to this project will be documented in this file.

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
