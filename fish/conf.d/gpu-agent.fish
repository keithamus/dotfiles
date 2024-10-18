gpg-agent -q
if test $status -ne 0
    gpg-agent --daemon >/dev/null ^ /dev/null
end
set -xg GPG_TTY (tty)
set -xg SSH_AUTH_SOCK ~/.1password/agent.sock
gpg-connect-agent updatestartuptty /bye >/dev/null
gpgconf --launch gpg-agent
