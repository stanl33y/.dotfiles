install:
	stow --verbose --target=$$HOME --restow */ && . $$HOME/.asdf/asdf.sh && ./install-asdf-plugins.sh && asdf install

update:
	git pull && stow --verbose --target=$$HOME --restow */ && ./install-asdf-plugins.sh && asdf install

remove:
	stow --verbose --target=$$HOME --delete */
