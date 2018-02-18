vim-install:
	ansible-playbook vim.yml -i local -vvv -e curdir=$(CURDIR) -K
setup-dev:
	ansible-playbook vagrant.yml -i local -vvv -e curdir=$(CURDIR) -K

