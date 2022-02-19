install:
	stow --verbose --target=$$HOME --restow */ && . $$HOME/.asdf/asdf.sh && asdf install

update:
	git pull && stow --verbose --target=$$HOME --restow */ && asdf install

remove:
	stow --verbose --target=$$HOME --delete */
