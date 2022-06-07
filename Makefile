default: install

install:
	nvim -c 'PackerBootstrap' -c 'quitall'
	nvim -c 'PackerInstall' -c 'quitall'

update:
	nvim -c 'PackerSync' -c 'quitall'

uninstall:
	nvim -c 'PackerUninstall' -c 'quitall'
