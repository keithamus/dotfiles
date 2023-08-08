gpg-agent -q
if test $status -ne "0"
  gpg-agent --daemon > /dev/null ^ /dev/null
end
set -xg GPG_TTY (tty)
set -xg SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpg-connect-agent updatestartuptty /bye > /dev/null
gpgconf --launch gpg-agent
