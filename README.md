# Config

## Requirements

[OhMyZsh](https://github.com/robbyrussell/oh-my-zsh)

Exuberant Ctags

[Powerline friendly fonts](https://github.com/powerline/fonts)

[Vim-Plug](https://github.com/junegunn/vim-plug)

[RipGrep](https://github.com/BurntSushi/ripgrep)

[fzf](https://github.com/junegunn/fzf)

## Installation

Install solarized, follow instructions and add dircolours.
```
git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
cd ~/.solarized
./install.sh
```

Clone the repo into a folder `.dotfiles`

Run the rake task to create symlinks etc:
`% rake install`

`git config --global core.excludesfile '~/.gitignore_global'`

Add [Hanami oh-mh-zsh plugin](https://github.com/davydovanton/hanami-zsh)

### Other cool things to install

[bat](https://github.com/sharkdp/bat)
[autojump](https://github.com/wting/autojump)

### Other things that need to be present

Python 3 and pip3 (Python version > 3.5)
`pip3 install neovim` for deoplete to work
