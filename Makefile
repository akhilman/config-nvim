default: install

share_path = $(HOME)/.local/share/nvim
site_path = $(share_path)/site

packer_path = $(site_path)/pack/packer/start/packer.nvim
packer_url = https://github.com/wbthomason/packer.nvim

$(packer_path):
	git clone --depth 1 $(packer_url) $(packer_path)

packer: $(packer_path)

install: packer
	nvim -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'

update: packer
	nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

uninstall:
	rm -rf plugin
	rm -rf $(packer_path)
