NVIM_CMD ?= nvim

default: install

install:
	$(NVIM_CMD) --headless -c 'PackerBootstrap' -c 'quitall'
	$(NVIM_CMD) -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	$(NVIM_CMD) --headless -c 'TSUpdateSync' -c 'quitall'

update:
	$(NVIM_CMD) -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	$(NVIM_CMD) --headless -c 'TSUpdateSync' -c 'quitall'

uninstall:
	$(NVIM_CMD) --headless --noplugin -c 'lua require("plugins").uninstall()' -c 'quitall'
