default: install

site = $(HOME)/.local/share/nvim/site
autoload = $(site)/autoload

$(autoload)/plug.vim:
	curl -fLo $(autoload)/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

plug.vim: $(autoload)/plug.vim

install: plug.vim
	nvim +PlugInstall +qall

update: plug.vim
	nvim +PlugUpgrade +PlugUpdate +qall

clean: plug.vim
	nvim +PlugClean +qall
