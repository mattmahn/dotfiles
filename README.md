# matt's dotfiles [![Build Status][tb]][tp]
> Config files for ZSH, Java, Ruby, Go, Editors, Terminals and more.

![screenshot][scrn]

[tb]: https://travis-ci.org/mattmahn/dotfiles.svg?branch=master
[tp]: https://travis-ci.org/mattmahn/dotfiles
[scrn]: https://raw.githubusercontent.com/mattmahn/dotfiles/master/screenshot.png

## Installation

### Dependencies

First, make sure you have all those things installed:

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `zsh`: to actually run the dotfiles
- `sudo`: some configs may need that
- `brew`: macOS (and technically Linux) package manager

### Install

Then, run these steps:

```console
$ git clone https://github.com/mattmahn/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./script/bootstrap
$ zsh # or just close and open your terminal again.
```

> All changed files will be backed up with a `.backup` suffix.

### Recommended Software

For OSX, I recommend:

- `grc`: for colorizing stuff (like `ls`);
- iTerm: a better terminal emulator;

Both:

- `diff-so-fancy`: better git difs (you'll need to run `dot_update` to apply it);

## Further help:

- [Personalize your configs](/docs/PERSONALIZATION.md)
- [Understand how it works](/docs/PHILOSOPHY.md)
- [License](/LICENSE.md)

## Contributing

Feel free to contribute. Pull requests will be automatically
checked/linted with [Shellcheck](https://github.com/koalaman/shellcheck).

## Thanks

I forked [caarlos0's](https://github.com/dotfiles) [Holman's](http://github.com/holman) excellent
[dotfiles](http://github.com/holman/dotfiles) and tweaked it to fit my
taste. I have also copied one thing or another from other people, so,
thanks everyone!
