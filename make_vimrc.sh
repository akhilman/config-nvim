#!/bin/sh

cd $(dirname $0)

for f in \
		./basic.vim \
		./default_colorscheme.vim; do
	echo \"\"\"\" $f
	echo
	cat $f
	echo
	echo
done
