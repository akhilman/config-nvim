default: install

share = $(HOME)/.local/share/nvim
site = $(share)/site
autoload = $(site)/autoload
plugged = $(share)/plugged

$(autoload)/plug.vim:
	curl -fLo $(autoload)/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

plug.vim: $(autoload)/plug.vim

install: plug.vim
	nvim +PlugInstall +UpdateRemotePlugins +qall

update: plug.vim
	nvim +PlugUpgrade +PlugUpdate +UpdateRemotePlugins +qall

clean: plug.vim
	nvim +PlugClean +qall

uninstall: $(plugged) $(autoload)/plug.vim
	rm -rf $(plugged)
	rm $(autoload)/plug.vim*
