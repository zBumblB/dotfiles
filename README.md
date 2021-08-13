# installation
first you need to decide where you want the dotfiles repo to be.
i use $HOME/.local/dotfiles which is what this config sets it to. if you want to use something else, you have to change the config alias in .config/zsh/aliasrc

clone the repo and checkout
```sh
git clone --bare 'https://github.com/zBumblB/dotfiles.git' $HOME/.local/dotfiles
```
```sh
git --git-dir=$HOME/.local/dotfiles --work-tree=$HOME checkout
```
next, we need to install the neovim and tmux plugins
```sh
config submodule update --init --recursive
```
# Finishing touches
that's it. the config is installed. the next few sections are not going to change anything, just cleanup a bit.
## config status
if you now run `config status`, you will probably see a bunch of untracked files. if you don't want to see them, just run
```sh
config config --local status.showUntrackedFiles no
```
you can also filter them with .gitignore. i don't like having .gitignore in my home folder, so i do
```sh
config config core.excludesfile ~/.local/dotfiles/gitignore
```
## repo files
in your home directory, you will see files from this repo such as README.md and .gitmodules. if you don't want them, you can safely delete them.

they will show in `config status` as deleted. if you don't want that, you can remove them from git index
```sh
config update-index --assume-unchanged README.md .gitmodules
```
