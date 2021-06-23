# programs
there are a couple of programs these dotfiles configure. you can install whichever you want. note that some configuration assumes other programs are installed.

for some programs only small changes are made like changing hsts file location in wget. these programs are not here.
## zsh
doesn't work with any other shells (may add support in the future, but prob not)
## starship
this is the prompt used. by default the shell doesn't work without it, but it wouldn't be hard to change it for something else
## zoxide
i use zoxide instead of cd. if you don't want to use it, you'll need to make some small changes to ~/.config/zsh
## tmux
does work without, but no reason not to use tmux.
## dunst
this is the notification daemon I use

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
## repo files
in your home directory, you will see files from this repo such as README.md and .gitmodules. if you don't want them, you can safely delete them.

they will show in `config status` as deleted. if you don't want that, you can remove them from git index
```sh
config update-index --assume-unchanged README.md .gitmodules
```
## .gitkeep files
they exist because you can't add empty directories. instead, i just created a .gitkeep file inside it and added that.
### you can safely remove them without anything breaking.
```sh
rm **/.gitkeep .*/**/.gitkeep
```
or
```sh
rm .local/desktop/.gitkeep .local/public/.gitkeep .local/templates/.gitkeep .local/tmp/.gitkeep Documents/.gitkeep Downloads/Browser/.gitkeep Downloads/Limbo/.gitkeep Downloads/Torrents/.gitkeep Music/.gitkeep Pictures/.gitkeep
```
### they will show as deleted in config status
to get around that, just remove them from git index.
```sh
config update-index --assume-unchanged .local/desktop/.gitkeep .local/public/.gitkeep .local/templates/.gitkeep .local/tmp/.gitkeep Documents/.gitkeep Downloads/Browser/.gitkeep Downloads/Limbo/.gitkeep Downloads/Torrents/.gitkeep Music/.gitkeep Pictures/.gitkeep
```
# notes
## it's for x11
i am planning to move to wayland soon, but currently this configuration is for x11. Programs like the shell will still work, but some x11 dependent configuration may break.
## it changes the keymap
i use a custom keymap based on si (qwertz). if you don't want to use it, you will need to edit ~/.config/x11/xinitrc appropriately. if you want to change it, it's the ~/.config/x11/keymap.xkb file, which is loaded at startup by the xinitrc file
## colors
this configuration uses gruvbox colorscheme, but you may notice that it doesn't change it in the terminal. that's because exa, zsh... use 4 or 8-bit colors, which are defined by (and can probably be changed in) the terminal. others (like neovim) use 24-bit (true color) colors.
