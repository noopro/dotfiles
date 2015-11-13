Dotfiles
========

This is my collection of [configuration files](http://dotfiles.github.io/).

Usage
-----

The `zsh` dotfiles depend on [prezto](https://github.com/sorin-ionescu/prezto),
so install that first:

```bash
$ git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
$ chsh -s /bin/zsh
```

Pull the repository, and then create the symbolic links using [GNU
stow](https://www.gnu.org/software/stow/).

```bash
$ git clone git@github.com:alexpearce/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow zsh vim # plus whatever else you'd like
```

There are two terminfo files in the `terminfo` directory.  These are for
[enabling italics in iTerm2, vim, and
tmux](https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/).
They are not added automatically.

License
-------

[MIT](http://opensource.org/licenses/MIT).
