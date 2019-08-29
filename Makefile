.PHONY: changelog release

all: documentation

define print_info
  @echo "                         ##############################################"
  @echo "$$(date  ${DATE_FORMAT}) ### INFO - $(1)"
  @echo "                         ##############################################"
endef

changelog:
	git-chglog -o CHANGELOG.md --next-tag `semtag final -s minor -o`

release:
	semtag final -s minor

documentation:
	$(call print_info, "Generating documentation")
	# generating input parameter documentation
	sed -E 's/^([[:space:]]*type[[:space:]]*=[[:space:]]*)([^ ]*)(.*)$$/\1"\2"\3/' variables.tf > variables.tf.temp
	terraform-docs markdown table --no-escape --sort-inputs-by-required --with-aggregate-type-defaults variables.tf.temp > docs/user/variables.md
	git add docs/user/variables.md

	# generating output parameter documentation
	terraform-docs markdown table --no-escape --sort-inputs-by-required --with-aggregate-type-defaults outputs.tf > docs/user/outputs.md
	git add docs/user/outputs.md
