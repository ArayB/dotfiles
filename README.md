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

[bat](https://github.com/sharkdp/bat) `brew install bat`

[autojump](https://github.com/wting/autojump) `brew install autojump`

[diff-so-fancy](https://github.com/so-fancy/diff-so-fancy) `brew install diff-so-fancy`

```
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
```

### Other things that need to be present

Python 3 and pip3 (Python version > 3.5)
`pip3 install neovim` for deoplete to work
