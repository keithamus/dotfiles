#!/usr/bin/env sh
THISDIR=$(cd "$(dirname "$0")"; pwd)
BREWFILE="$THISDIR/Brewfile"

if [ "$(uname -s)" = "Darwin" ]
then
  ./homebrew/install.sh
  brew install gnupg
elif [ "$(uname -s)" = "Linux" -a "$GDMSESSION" = "pop" ]
then
  sudo apt install -qq -y --no-install-recommends gnupg
fi

cat <<EOF
I'm refusing to import a GPG key automatically, due to the security concerns,
but you can do so manually if you have an existing key:


If you're on the machine that already has the key:

    gpg --export-secret-key SOMEKEYID | ssh othermachine gpg --import

If you're on the machine that needs the key:

    ssh othermachine gpg --export-secret-key SOMEKEYID | gpg --import


Once impored you'll also want to set:

    git config --global user.signingkey SOMEKEYID
EOF
