# Dotfiles

Go install [briefcase](http://jim.github.com/briefcase/) and then run the following:

```bash
git clone git@github.com:keithamus/dotfiles.git ~/.dotfiles
briefcase sync
```

If you're on a Mac, do the following to make it more awesomer:

```bash
brew install bash # get bash 4.2.20 with autocd
brew install tig # Tig is git, but moar awesomer
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
```

Also if you want bash 4.2.20, you need to do annoying stuff... either edit /etc/shell and replace 
/bin/bash with /usr/local/bin/bash, or in iterm/terminal hit `cmd+,` and find the bit which looks 
like `login -fp <username>` and append /usr/local/bin/bash, so it now looks like 
`login -fp <username> /usr/local/bin/bash`. I don't care which you do.

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