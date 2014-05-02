# Dotfiles

1. Run `gem install [briefcase](http://jim.github.com/briefcase/)`
2. Make a ~/.briefcase_secrets file, which should look like:

```
---
gitconfig:
  gitconfigName: My Full Name
  gitconfigEmail: myemail@address.com
```

3. Run `git clone git@github.com:keithamus/dotfiles.git ~/.dotfiles`
4. Run `briefcase generate`
5. Run `briefcase sync`

If you're on a Mac, do the following to make it more awesomer:

```bash
brew install bash # get bash 4.2.20 with autocd
brew install tig # Tig is git, but moar awesomer
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
```

Also if you want bash 4.2.20, you need to do annoying stuff...

1. Edit /etc/shells and add `/usr/local/bin/bash` as an extra line
2. Run the command `sudo chsh -s /usr/local/bin/bash $USER`

# Quick functions

### Project
The `project` function is a shorthand for `cd ~/Projects/<projectName>; clean; git status -s`. Which
is a quick way to switch to a project you're working on. the "~/Projects" dir can be changed by
exporting PROJECTS_PATH at any time.
It also has bash completion.

### Headless
`headless` is a shortcut for running VirtualBox vms headlessly. Specify `headless start <VM>` to
start one, and `headless stop <VM>` to stop one. If you don't know or don't care if you're stopping
or starting, then ommit that, and just do `headless <VM>`. It will work out what to do.
It also has bash completion

### Xtract
`xtract` can be used to unarchive zips/tars/etc without the headache of remembering xfv style
combos. Just literally type `xtract <filename>`, it'll do the rest.
No bash completion here, maybe someday.

### Git
`git` is a more cleverer alias for git, but it does some stuff around `tig`. Tig is awesome, and you
want it. This is a set and forget thing, don't worry, it'll do the magics.

### Nano
`nano` has been replaced by a command which asks if you want to use subl instead. Good for if, like
me, you habitually type "nano <file>" when you really would like Sublime instead. Yup.

### Gifify

`gifify` will turn any movie file (ones supported by ffmpeg - so basically all of them) into a gif. Pass in `--good` as the second argument (i.e `gifify file.mov --good`) to convert a gif as higher quality, but bigger file size and longer encoding time. This requires 4 dependendies: ffmpeg, ImageMagick, gifsicle and XQuartz if on a mac. For Macs with Homebrew simply `brew install ffmpeg imagemagick gifsicle` after you've installed XQarts.
