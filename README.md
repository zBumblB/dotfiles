# installation
## clone the repo and checkout
```sh
git clone --bare 'https://github.com/zBumblB/dotfiles.git' $HOME/.local/dotfiles
```
```sh
git --git-dir=$HOME/.local/dotfiles --work-tree=$HOME checkout
```
# finishing touches
that's it. the config is installed. the next few sections are not going to change anything, just cleanup a bit.
## config status
if you now run `config status`, you will probably see a bunch of untracked files. if you don't want to see them, just run
```sh
config config --local status.showUntrackedFiles no
```
you can also filter them with .gitignore. i don't like having .gitignore in my home folder, so i do
```sh
config config core.excludesfile ~/.local/.dotignore
```
## repo files
in your home directory, you will see the README.md file. if you don't want it, you can safely delete it.

it will show in `config status` as deleted. if you don't want that, you can remove it from git index
```sh
config update-index --assume-unchanged README.md
```
