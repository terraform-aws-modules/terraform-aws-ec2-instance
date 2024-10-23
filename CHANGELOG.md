# Changelog

All notable changes to this project will be documented in this file.

## [5.7.1](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.7.0...v5.7.1) (2024-10-11)


### Bug Fixes

* Update CI workflow versions to latest ([#409](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/409)) ([e48d67f](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/e48d67f339c72bb44a544729fa685e347ea6256e))

## [5.7.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.6.1...v5.7.0) (2024-08-26)


### Features

* Added parameter to attach aws_eip ([#391](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/391)) ([57cdd5d](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/57cdd5d376939ec8a177c4622d3fe8c6f12c68c7))

## [5.6.1](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.6.0...v5.6.1) (2024-03-07)


### Bug Fixes

* Update CI workflow versions to remove deprecated runtime warnings ([#379](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/379)) ([2c9e615](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/2c9e6156d375cf6adcfef95198318556f19f08f7))

## [5.6.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.5.0...v5.6.0) (2023-12-25)


### Features

* Support Private DNS name options ([#370](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/370)) ([d3520fd](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/d3520fd9afc35a2598604e4219ade15021960ba9))

## [5.5.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.4.0...v5.5.0) (2023-08-30)


### Features

* Add example for connecting via Session Manager without Internet access ([#336](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/336)) ([68edef8](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/68edef8e2a83f6492db63b684cf5ad7065b89d6f))

## [5.4.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.3.1...v5.4.0) (2023-08-30)


### Features

* Add `availability_zone` output ([#347](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/347)) ([1b2cdeb](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/1b2cdeba14ee0aba4f687996fde8ab6eb2ad27c6))

### [5.3.1](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.3.0...v5.3.1) (2023-08-17)


### Bug Fixes

* Fixed ami variable when using without ssm ([#354](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/354)) ([a1691a0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/a1691a050d92e800b584a5624f3d8f2114e000c6))

## [5.3.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.2.1...v5.3.0) (2023-08-16)


### Features

* Remove call data ssm parameter when ami id is specified ([#351](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/351)) ([7ffc3dd](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/7ffc3dd843efecd543fecb0a1b556004d7db2bb7))

### [5.2.1](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.2.0...v5.2.1) (2023-07-06)


### Bug Fixes

* Fixed outputs for Block Devices ([#344](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/344)) ([80381d2](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/80381d2c94e6aec7aa308f4a6cf24732a87c8237))

## [5.2.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.1.0...v5.2.0) (2023-06-28)


### Features

* Add input variable 'instance_tags' ([#343](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/343)) ([025d3b4](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/025d3b4beca9835a5e997e41677a4c6441a733f4))

## [5.1.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v5.0.0...v5.1.0) (2023-05-30)


### Features

* Implementation of the cpu_options block and addition of support for AMD SEV-SNP ([#334](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/334)) ([6a123ad](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/6a123adb10393759fcdd18795fbf1484c5f44dde))

## [5.0.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.5.0...v5.0.0) (2023-04-28)


### ⚠ BREAKING CHANGES

* Raise minimum required Terraform version to 1.0+ (#331)

### Features

* Raise minimum required Terraform version to 1.0+ ([#331](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/331)) ([9d4e0ca](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/9d4e0ca389535522808ddf988e3a6510bb143161))

## [4.5.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.4.0...v4.5.0) (2023-04-21)


### Features

* Add unique tags to EBS block devices ([#327](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/327)) ([55ed759](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/55ed759b9fbc475629da2d5068a593a2ce08d8dc))

## [4.4.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.3.1...v4.4.0) (2023-04-21)


### Features

* Addition of block device information in outputs ([#319](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/319)) ([884e244](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/884e24466e19144e6b5a1085ab81b377174c6e0c))

### [4.3.1](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.3.0...v4.3.1) (2023-04-21)


### Bug Fixes

* Marked AMI id as nonsensitive ([#321](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/321)) ([1ae1d5c](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/1ae1d5ce73d6bef0e42821406f82ff16fe718177))

## [4.3.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.2.1...v4.3.0) (2023-01-01)


### Features

* Add support for `maintenance_options` ([#312](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/312)) ([2aaa990](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/2aaa99011a5ae0224da13691e9d288a5ef7cbd0d))

### [4.2.1](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.2.0...v4.2.1) (2022-11-07)


### Bug Fixes

* Update CI configuration files to use latest version ([#303](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/303)) ([2151031](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/21510318bffcfa84a13c5ec8cbb93dff9871a4f9))

## [4.2.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.1.4...v4.2.0) (2022-11-04)


### Features

* Add support for creating IAM role/instance profile with policies ([#302](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/302)) ([787132e](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/787132e5dbe7b58e4b9a62e1a69a682bcbb9bd58))

### [4.1.4](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.1.3...v4.1.4) (2022-08-13)


### Bug Fixes

* Correct capacity reservation target ([#288](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/288)) ([135145e](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/135145e252c69814c019da49c638973f93523f6a))

### [4.1.3](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.1.2...v4.1.3) (2022-08-12)


### Bug Fixes

* The capacity_reservation_specification default value is updated from null to {} ([#285](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/285)) ([9af6601](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/9af6601abbcfe06fc907ea1eb3abffe30d26daf2))

### [4.1.2](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.1.1...v4.1.2) (2022-08-10)


### Bug Fixes

* Assignment of the Capacity Reservation id to an instance ([#282](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/282)) ([7f0a0ae](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/7f0a0ae66cbe50d0ea1c09191de4e82cfa8c4ca2))

### [4.1.1](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.1.0...v4.1.1) (2022-07-21)


### Bug Fixes

* Creation of an Instance with a Capacity Reservation ID ([#278](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/278)) ([f12ac95](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/f12ac95aa309fdbf532ba1d5a9841690ca7fdb8e))

## [4.1.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v4.0.0...v4.1.0) (2022-07-19)


### Features

* Add support for `disable_api_stop` attribute ([#275](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/275)) ([cb367ec](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/cb367ec54e4386512e37b8ef0b8d01c78f589fb1))

## [4.0.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v3.6.0...v4.0.0) (2022-05-09)


### ⚠ BREAKING CHANGES

* Add support for user_data_replace_on_change, and updated AWS provider to v4.7+ (#272)

### Features

* Add support for user_data_replace_on_change, and updated AWS provider to v4.7+ ([#272](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/272)) ([4d7f3d8](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/4d7f3d873b0d2be7361d439e62b872a895073342))

## [3.6.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v3.5.0...v3.6.0) (2022-05-06)


### Features

* Added wrappers automatically generated via pre-commit hook ([#271](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/271)) ([6e8c541](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/6e8c541b2d9b3fe54c9acc7f4d271648c5844c9b))

## [3.5.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v3.4.0...v3.5.0) (2022-03-12)


### Features

* Made it clear that we stand with Ukraine ([6867788](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/6867788411a202b61187f9935e9eaa72a18f0bbe))

## [3.4.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v3.3.0...v3.4.0) (2022-01-14)


### Features

* Add `instance_metadata_tags` attribute and bump AWS provider to support ([#254](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/254)) ([b2fb960](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/b2fb9604b32aa23d14a8a6e3cff761d6c69661b7))

# [3.3.0](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v3.2.1...v3.3.0) (2021-11-22)


### Features

* Add instance IPv6 addresses to the outputs ([#249](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/249)) ([08bdf6a](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/08bdf6af910f665149d8d64a19175b89a8fac447))

## [3.2.1](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v3.2.0...v3.2.1) (2021-11-22)


### Bug Fixes

* update CI/CD process to enable auto-release workflow ([#250](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/250)) ([1508c9e](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/commit/1508c9ec45ba954828c734326366143a17434a0f))

<a name="v3.2.0"></a>
## [v3.2.0] - 2021-10-07

- feat: Add instance private IP to the outputs ([#241](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/241))


<a name="v3.1.0"></a>
## [v3.1.0] - 2021-08-27

- feat: add support for spot instances via spot instance requests ([#236](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/236))
- chore: update `README.md` example for making an encrypted AMI ([#235](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/235))


<a name="v3.0.0"></a>
## [v3.0.0] - 2021-08-26

- BREAKING CHANGE: update module to include latest features and remove use of `count` for module `count`/`for_each` ([#234](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/234))


<a name="v2.21.0"></a>
## [v2.21.0] - 2021-08-26

- feat: Add support for EBS GP3 throughput ([#233](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/233))


<a name="v2.20.0"></a>
## [v2.20.0] - 2021-08-25

- feat: Add cpu optimization options ([#181](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/181))


<a name="v2.19.0"></a>
## [v2.19.0] - 2021-05-12

- fix: root_block_device tags conflicts ([#220](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/220))


<a name="v2.18.0"></a>
## [v2.18.0] - 2021-05-11

- feat: add tags support to root block device ([#218](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/218))
- chore: update CI/CD to use stable `terraform-docs` release artifact and discoverable Apache2.0 license ([#217](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/217))
- chore: Updated versions&comments in examples
- chore: update documentation and pin `terraform_docs` version to avoid future changes ([#212](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/212))
- chore: align ci-cd static checks to use individual minimum Terraform versions ([#207](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/207))
- chore: add ci-cd workflow for pre-commit checks ([#201](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/201))


<a name="v2.17.0"></a>
## [v2.17.0] - 2021-02-20

- chore: update documentation based on latest `terraform-docs` which includes module and resource sections ([#200](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/200))


<a name="v2.16.0"></a>
## [v2.16.0] - 2020-12-10

- feat: Add support for metadata_options argument ([#193](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/193))


<a name="v2.15.0"></a>
## [v2.15.0] - 2020-06-10

- feat: Add "num_suffix_format" variable for instance naming ([#147](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/147))


<a name="v2.14.0"></a>
## [v2.14.0] - 2020-06-10

- Updated README
- Updated t instance type check to include t3a type ([#145](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/145))
- Updated README
- Instance count as output ([#121](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/121))
- Added user_data_base64 (fixed [#117](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/117)) ([#137](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/137))
- Added support for network_interface and arn ([#136](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/136))
- Update outputs to remove unneeded function wrappers ([#135](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/135))
- Track all changes (remove ignore_changes lifecycle) ([#125](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/125))
- Add encrypted and kms_key_id arguments to the ebs_* and root_* block ([#124](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/124))
- Remove T2 specifics to unify Terraform object names inside TF State ([#111](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/111))
- Fixed output of placement_group (fixed [#104](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/104)) ([#110](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/110))
- Add get_password_data ([#105](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/105))
- Fixed when private_ips is empty (fixed [#103](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/103))
- Added support for the list of private_ips (fixes [#102](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/102)) ([#103](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/103))
- Added support for placement group and volume tags ([#96](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/96))
- Terraform 0.12 update ([#93](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/93))


<a name="v1.25.0"></a>
## [v1.25.0] - 2020-03-05

- Updated t instance type check to include t3a type ([#146](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/146))
- Added placement groups ([#94](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/94))
- Revert example
- Added placement groups
- Add volume tags naming and output ([#82](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/82))


<a name="v2.13.0"></a>
## [v2.13.0] - 2020-03-05

- Updated t instance type check to include t3a type ([#145](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/145))


<a name="v2.12.0"></a>
## [v2.12.0] - 2019-11-19

- Updated README
- Instance count as output ([#121](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/121))


<a name="v2.11.0"></a>
## [v2.11.0] - 2019-11-19

- Added user_data_base64 (fixed [#117](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/117)) ([#137](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/137))


<a name="v2.10.0"></a>
## [v2.10.0] - 2019-11-19

- Added support for network_interface and arn ([#136](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/136))


<a name="v2.9.0"></a>
## [v2.9.0] - 2019-11-19

- Update outputs to remove unneeded function wrappers ([#135](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/135))


<a name="v2.8.0"></a>
## [v2.8.0] - 2019-08-27

- Track all changes (remove ignore_changes lifecycle) ([#125](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/125))


<a name="v2.7.0"></a>
## [v2.7.0] - 2019-08-27

- Add encrypted and kms_key_id arguments to the ebs_* and root_* block ([#124](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/124))


<a name="v2.6.0"></a>
## [v2.6.0] - 2019-07-21

- Remove T2 specifics to unify Terraform object names inside TF State ([#111](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/111))


<a name="v2.5.0"></a>
## [v2.5.0] - 2019-07-08

- Fixed output of placement_group (fixed [#104](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/104)) ([#110](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/110))


<a name="v2.4.0"></a>
## [v2.4.0] - 2019-06-24

- Add get_password_data ([#105](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/105))


<a name="v2.3.0"></a>
## [v2.3.0] - 2019-06-15

- Fixed when private_ips is empty (fixed [#103](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/103))


<a name="v2.2.0"></a>
## [v2.2.0] - 2019-06-14

- Added support for the list of private_ips (fixes [#102](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/102)) ([#103](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/103))


<a name="v2.1.0"></a>
## [v2.1.0] - 2019-06-08

- Added support for placement group and volume tags ([#96](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/96))
- Terraform 0.12 update ([#93](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/93))


<a name="v1.24.0"></a>
## [v1.24.0] - 2019-06-06

- Added placement groups ([#94](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/94))
- Revert example
- Added placement groups


<a name="v1.23.0"></a>
## [v1.23.0] - 2019-06-06

- Add volume tags naming and output ([#82](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/82))


<a name="v2.0.0"></a>
## [v2.0.0] - 2019-06-06

- Terraform 0.12 update ([#93](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/93))


<a name="v1.22.0"></a>
## [v1.22.0] - 2019-06-06

- Update module to the current version ([#88](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/88))


<a name="v1.21.0"></a>
## [v1.21.0] - 2019-03-22

- Fix formatting
- examples/basic/main.tf: Add usage of "root_block_device" ([#18](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/18)) ([#65](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/65))


<a name="v1.20.0"></a>
## [v1.20.0] - 2019-03-22

- Fix formatting
- main.tf: Make number of instances created configurable, defaulting to 1 ([#64](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/64))
- Add missing required field ([#81](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/81))


<a name="v1.19.0"></a>
## [v1.19.0] - 2019-03-01

- Fixed readme after [#76](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/76)
- network_interface_id Attribute Removal ([#76](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/76))


<a name="v1.18.0"></a>
## [v1.18.0] - 2019-02-27

- fix count variables are only valid within resources ([#72](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/72))


<a name="v1.17.0"></a>
## [v1.17.0] - 2019-02-25

- fix call to local.instance_name ([#71](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/71))


<a name="v1.16.0"></a>
## [v1.16.0] - 2019-02-25

- Fixed readme
- Ability to append numerical suffix even to 1 instance ([#70](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/70))


<a name="v1.15.0"></a>
## [v1.15.0] - 2019-02-21

- Allow multiple subnet ids ([#67](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/67))


<a name="v1.14.0"></a>
## [v1.14.0] - 2019-01-26

- Tags should be possible to override (fixed [#53](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/53)) ([#66](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/66))
- fix typo ([#61](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/61))


<a name="v1.13.0"></a>
## [v1.13.0] - 2018-10-31

- Include the module version and some code formatting ([#52](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/52))


<a name="v1.12.0"></a>
## [v1.12.0] - 2018-10-06

- Fixed [#51](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/51). t2 and t3 instances can be unlimited


<a name="v1.11.0"></a>
## [v1.11.0] - 2018-09-04

- Added example of EBS volume attachment (related to [#46](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/46)) ([#47](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/47))
- Ignore changes in the ebs_block_device ([#46](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/46))


<a name="v1.10.0"></a>
## [v1.10.0] - 2018-08-18

- [master]: Narrow t2 selection criteria. ([#44](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/44))


<a name="v1.9.0"></a>
## [v1.9.0] - 2018-06-08

- Fixed t2-unlimited bug (related issue [#35](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/35)) ([#37](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/37))


<a name="v1.8.0"></a>
## [v1.8.0] - 2018-06-04

- Added support for CPU credits ([#35](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/35))


<a name="v1.7.0"></a>
## [v1.7.0] - 2018-06-02

- Added encrypted AMI info ([#34](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/34))


<a name="v1.6.0"></a>
## [v1.6.0] - 2018-05-16

- Added pre-commit hook to autogenerate terraform-docs ([#33](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/33))


<a name="v1.5.0"></a>
## [v1.5.0] - 2018-04-04

- Minor formatting fix
- Modify tag name management to add -%d suffixe only if instance_count > 1


<a name="v1.4.0"></a>
## [v1.4.0] - 2018-04-04

- Stop ignoring changes in vpc_security_group_ids


<a name="v1.3.0"></a>
## [v1.3.0] - 2018-03-06

- Renamed count to instance_count (fixes [#23](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/23))
- Fix: add missing variable to the usage example


<a name="v1.2.1"></a>
## [v1.2.1] - 2018-03-01

- Added aws_eip to example and pre-commit hooks


<a name="v1.2.0"></a>
## [v1.2.0] - 2018-01-19

- Add tags to output variables


<a name="v1.1.0"></a>
## [v1.1.0] - 2017-12-08

- Make module idempotent by requiring subnet_id and ignore changes in several arguments (fixes [#10](https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/issues/10))


<a name="v1.0.4"></a>
## [v1.0.4] - 2017-11-21

- Removed placement_group from outputs


<a name="v1.0.3"></a>
## [v1.0.3] - 2017-11-15

- Fix incorrect subnet_id output expression
- Updated example with all-icmp security group rule


<a name="v1.0.2"></a>
## [v1.0.2] - 2017-10-13

- Added example with security-group module


<a name="v1.0.1"></a>
## [v1.0.1] - 2017-09-14

- Updated example and made security group required


<a name="v1.0.0"></a>
## v1.0.0 - 2017-09-12

- Updated repo name
- Updated README
- Added complete code with example and READMEs
- Initial commit


[Unreleased]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v3.2.0...HEAD
[v3.2.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v3.1.0...v3.2.0
[v3.1.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v3.0.0...v3.1.0
[v3.0.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.21.0...v3.0.0
[v2.21.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.20.0...v2.21.0
[v2.20.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.19.0...v2.20.0
[v2.19.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.18.0...v2.19.0
[v2.18.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.17.0...v2.18.0
[v2.17.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.16.0...v2.17.0
[v2.16.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.15.0...v2.16.0
[v2.15.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.14.0...v2.15.0
[v2.14.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.25.0...v2.14.0
[v1.25.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.13.0...v1.25.0
[v2.13.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.12.0...v2.13.0
[v2.12.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.11.0...v2.12.0
[v2.11.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.10.0...v2.11.0
[v2.10.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.9.0...v2.10.0
[v2.9.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.8.0...v2.9.0
[v2.8.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.7.0...v2.8.0
[v2.7.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.6.0...v2.7.0
[v2.6.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.5.0...v2.6.0
[v2.5.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.4.0...v2.5.0
[v2.4.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.3.0...v2.4.0
[v2.3.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.2.0...v2.3.0
[v2.2.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.1.0...v2.2.0
[v2.1.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.24.0...v2.1.0
[v1.24.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.23.0...v1.24.0
[v1.23.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v2.0.0...v1.23.0
[v2.0.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.22.0...v2.0.0
[v1.22.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.21.0...v1.22.0
[v1.21.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.20.0...v1.21.0
[v1.20.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.19.0...v1.20.0
[v1.19.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.18.0...v1.19.0
[v1.18.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.17.0...v1.18.0
[v1.17.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.16.0...v1.17.0
[v1.16.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.15.0...v1.16.0
[v1.15.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.14.0...v1.15.0
[v1.14.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.13.0...v1.14.0
[v1.13.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.12.0...v1.13.0
[v1.12.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.11.0...v1.12.0
[v1.11.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.10.0...v1.11.0
[v1.10.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.9.0...v1.10.0
[v1.9.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.8.0...v1.9.0
[v1.8.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.7.0...v1.8.0
[v1.7.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.6.0...v1.7.0
[v1.6.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.5.0...v1.6.0
[v1.5.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.4.0...v1.5.0
[v1.4.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.3.0...v1.4.0
[v1.3.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.2.1...v1.3.0
[v1.2.1]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.2.0...v1.2.1
[v1.2.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.1.0...v1.2.0
[v1.1.0]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.0.4...v1.1.0
[v1.0.4]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.0.3...v1.0.4
[v1.0.3]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.0.2...v1.0.3
[v1.0.2]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.0.1...v1.0.2
[v1.0.1]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance/compare/v1.0.0...v1.0.1
