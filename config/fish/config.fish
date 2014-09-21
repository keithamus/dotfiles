# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins brew emoji-clock extract node rvm sublime z

# Path to your custom folder (default path is $FISH/custom)
set fish_custom $HOME/.config/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

test -s $HOME/.nvm-fish/nvm.fish; and source $HOME/.nvm-fish/nvm.fish
