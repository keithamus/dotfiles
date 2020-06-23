#!/usr/bin/env sh
if [ ! -d "$HOME/.asdf" ]
then
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
fi
cd ~/.asdf

if [ ! "$(which asdf)" ]
then
	echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
	if [ "$(which bash)" = "$SHELL" ]
	then
		. ~/.bashrc
	fi
fi

asdf() {
  ~/.asdf/bin/asdf $@
}

asdf update
asdf plugin update --all

asdf plugin add deno
asdf install deno latest
asdf global deno $(asdf list deno | head -1 | tr -d '[:space:]')

asdf plugin add direnv
asdf install direnv latest
asdf global direnv $(asdf list direnv | head -1 | tr -d '[:space:]')

asdf plugin add golang
asdf install golang latest
asdf global golang $(asdf list golang | head -1 | tr -d '[:space:]')

asdf plugin add nodejs
~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs latest
asdf global nodejs $(asdf list nodejs | head -1 | tr -d '[:space:]')

asdf plugin add python
if [ "$(uname -s)" = "Linux" -a "$(which apt)" ]
then
 sudo apt install -y --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
fi
asdf install python latest
asdf global python $(asdf list python | head -1 | tr -d '[:space:]')

asdf plugin add ruby
asdf install ruby latest
asdf global ruby $(asdf list ruby | head -1 | tr -d '[:space:]')

asdf plugin add rust
asdf install rust latest
asdf global rust $(asdf list rust | head -1 | tr -d '[:space:]')
