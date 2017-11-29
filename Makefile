vim-install:
	ansible-playbook vim.yml -i local -vvv -e curdir=$(CURDIR) -K