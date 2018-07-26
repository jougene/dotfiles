vim-install:
	ansible-playbook vim.yml -i local -vvv -e curdir=$(CURDIR) -K
setup-dev:
	ansible-playbook dev.yml -i local -vvv -e curdir=$(CURDIR) -K

