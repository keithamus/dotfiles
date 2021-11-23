#!/usr/bin/env sh
"$(dirname "$0")/../auto-install.sh" "$0"

if [ ! -d "$HOME/.asdf" ]
then
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
fi
cd ~/.asdf || exit 1

if [ ! "$(which asdf 2>/dev/null)" ]
then
	echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc
	if [ "$(which bash 2>/dev/null)" = "$SHELL" ]
	then
		# shellcheck disable=SC1091
		. "$HOME/.bashrc"
	fi
fi

export PATH="$PATH:$HOME/.asdf/bin"

asdf update
asdf plugin update --all

asdf plugin add deno
asdf install deno latest
asdf global deno "$(asdf list deno | head -1 | tr -d '[:space:]')"

asdf plugin add direnv
asdf install direnv latest
asdf global direnv "$(asdf list direnv | head -1 | tr -d '[:space:]')"

asdf plugin add golang
asdf install golang latest
asdf global golang "$(asdf list golang | head -1 | tr -d '[:space:]')"

asdf plugin add nodejs
~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs latest
asdf global nodejs $(asdf list nodejs | head -1 | tr -d '[:space:]')

asdf plugin add python
asdf install python latest
asdf global python $(asdf list python | head -1 | tr -d '[:space:]')

asdf plugin add ruby
asdf install ruby latest
asdf global ruby $(asdf list ruby | head -1 | tr -d '[:space:]')

asdf plugin add rust
asdf install rust latest
asdf global rust "$(asdf list rust | head -1 | tr -d '[:space:]')"
