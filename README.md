# Config

## Requirements

Exuberant Ctags

[Powerline friendly fonts](https://github.com/powerline/fonts)

[Vim-Plug](https://github.com/junegunn/vim-plug)

[RipGrep](https://github.com/BurntSushi/ripgrep)

[fzf](https://github.com/junegunn/fzf)

## Installation

Clone the repo into a folder `.dotfiles`

Create symbolic links for the relevant files in that folder to the root folder.
`% ln -s ~/.dotfiles/UltiSnips ~/.vim/UltiSnips`

Create symbolic link for `init.vim` in `~/.config/nvim` to use Neovim

Install solarized, follow instructions and add dircolours.
```
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
cd ~/.solarized
./install.sh
```

Once `.gitignore_global` is symlinked add it to git config.

`git config --global core.excludesfile '~/.gitignore_global'`

Add [Hanami oh-mh-zsh plugin](https://github.com/davydovanton/hanami-zsh)

Create symbolic link for `~/.dotfiles/ohmyzshthemes/themes` to `~/.oh-my-zsh/custom/`
