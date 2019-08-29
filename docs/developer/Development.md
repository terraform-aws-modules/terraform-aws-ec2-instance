# Developer Documentation

## Generating the documentation

The commandline application 
[terraform-docs](https://github.com/segmentio/terraform-docs) is used for
generating documentation from the files [`variables.tf`](../../variables.tf)
and [`outputs.tf`](../../outputs.tf).

Currently (v0.6.0) the tool does not yet support HCL2
(see issue "[#62](https://github.com/segmentio/terraform-docs/issues/62)
Add support for Terraform 0.12's Rich Value Types" for details).
Therefore both files must use the old Terraform 0.11 syntax for:
- interpolation language statements
- locals and
- variables

(they must use be surrounded by `"${` and `}"`)

### Installation of terraform-docs

There are several ways to install the tool:

* Download the precompiled binary from the
  [release page](https://github.com/segmentio/terraform-docs/releases/)

* using `go get` (requires installed Go)

      GO111MODULE=off go get github.com/segmentio/terraform-docs

### Using terraform-docs

The [Makefile](../../Makefile) contains a target `documentation`
for generating the documentation and add the files to git.

      make
      # or
      make documentation 
