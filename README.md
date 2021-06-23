# .gitkeep files
They are there because you can't add empty directories.
## You can safely remove them without anything breaking.
```sh
rm **/.gitkeep .*/**/.gitkeep
```
or
```sh
rm .local/desktop/.gitkeep .local/public/.gitkeep .local/templates/.gitkeep .local/tmp/.gitkeep Documents/.gitkeep Downloads/Browser/.gitkeep Downloads/Limbo/.gitkeep Downloads/Torrents/.gitkeep Music/.gitkeep Pictures/.gitkeep
```
## They will show as deleted in git status
To get around that, just remove them from git index.

Assuming config is aliased to the git bare repo, the command is
```sh
config update-index --assume-unchanged .local/desktop/.gitkeep .local/public/.gitkeep .local/templates/.gitkeep .local/tmp/.gitkeep Documents/.gitkeep Downloads/Browser/.gitkeep Downloads/Limbo/.gitkeep Downloads/Torrents/.gitkeep Music/.gitkeep Pictures/.gitkeep
```
