# stanl33y dotfiles
requires GNU Stow https://www.gnu.org/software/stow/ and ZSH
| distro | command |
| ------ | ------ |
| fedora | sudo dnf install stow |
| ubuntu/debian | sudo apt install stow |
| arch | sudo pacman -S stow |

## How to use
```sh
git clone --depth 1 --recursive https://github.com/stanl33y/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles && make install
```
## How to update
```sh
cd ~/.dotfiles && make update
```
## How to remove
```sh
cd ~/.dotfiles && make remove
```
