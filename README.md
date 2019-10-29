Dotfiles
========

These are my dotfiles, which I primarily use on OS-X. They're managed using gnu stow.

Installation
------------
- Clone this repo to $HOME, with submodules
```
git clone --recurse-submodules  git@github.com:avmohan/dotfiles.git
```

- Install gnu-stow and `stow` required folders from $HOME.
```
stow -v --dotfiles zsh
stow -v --dotfiles git
...
```

Todos
-----
- Cross platform across OS-X & Ubuntu
- Remove/Reduce external set-up steps
- Multiple files in ./private, number them, and import based on numbering order
- os x defaults write configs

