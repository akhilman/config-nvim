default: install

install:
	nvim --headless -c 'PackerBootstrap' -c 'quitall'
	nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	# nvim --headless -c 'TSUpdateSync' -c 'quitall'

update:
	nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	# nvim --headless -c 'TSUpdateSync' -c 'quitall'

uninstall:
	nvim --headless -c 'PackerUninstall' -c 'quitall'
