
default: help
.PHONY: default

help:
	@echo 'Usage:'
	@echo '	$$ make [action]'
	@echo
	@echo 'Ex:'
	@echo '	$$ make'
	@echo '	$$ make help'
	@echo
	@echo '	$$ make eos-keyring-add'
	@echo
	@echo '	$$ make eos-repo-add'
	@echo
	@echo '	$$ make prepare'
	@echo
	@echo '	$$ make build'
	@echo
.PHONY: help




eos-keyring-add:
	@./eos-keyring-add.sh
.PHONY: eos-keyring-add




eos-repo-add:
	@./eos-repo-add.sh
.PHONY: eos-repo-add




prepare:
	@./prepare.sh
.PHONY: prepare




build:
	@./build.sh
.PHONY: build




clean:
	sudo rm -rf /opt/tmp/endeavouros
.PHONY: clean
