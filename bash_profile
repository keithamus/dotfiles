# Include bash shopt options
# --------------------------
. ~/.bash_options

# Include bash completions
# ------------------------
if [ -a "`brew --prefix`/etc/bash_completion" ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Include NPM completions:
if [ `which npm` ]; then
    . <(npm completion)
fi

# Include Z
# ---------
if [ -a "`brew --prefix`/etc/profile.d/z.sh" ]; then
    . `brew --prefix`/etc/profile.d/z.sh
fi

# Include RVM
# -----------
. ~/.rvm/scripts/rvm

# Set PS1 to be Git-Aware
# -----------------------
function __git_ps1_expand() {
    gitps1=$(__git_ps1 "%s")
    if [[ -z "${gitps1}" ]]; then
	return;
    fi

    dirty=""

    # If your branch is dirty (it has a diff) then put a *
    git diff --quiet HEAD &>/dev/null
    if [[ $? == 1 ]]; then
        dirty="*"
    fi

    # If your branch is behind origin (HEAD is different to origin) then put a ↑
    git rev-parse --quiet HEAD &>/dev/null
    if [[ $? == 0 ]]; then
        commitsbehind="`git rev-list HEAD --not --remotes | wc -l | sed -e 's/^ *//g' -e 's/ *$//g'`"
        if [[ "${commitsbehind}" != "0" ]]; then
            dirty="${dirty}↑${commitsbehind}"
        fi
    fi

    github=""
    git config remote.origin.url | grep "github" &>/dev/null
    if [[ $? == 0 ]]; then
        github="gh:"
    fi

    if [[ $gitps1 != "" ]]; then
        echo " (${github}${gitps1}${dirty})"
    fi
}

function findup() {
    local file="$1"
    local result=1
    local dir="`pwd`"
    while [[ $dir != "/" ]]; do
        if [[ -e "$dir/$file" ]]; then
            result=0
            echo "$dir"
            break
        fi
        dir=`dirname $dir`
    done
    return $result
}

# Set PS1 to be NPM aware
# -----------------------
function __npm_dir_expand() {
    local npmprefix=`findup package.json`
    if [[ -n "$npmprefix" ]]; then
        local folder=${PWD#${npmprefix}}
        local npmpackage=`npm ls --depth=-1 --long . --loglevel silent | head -1`
        if [ "${npmpackage}" ]; then
            # echo "${PWD/${HOME}/~} ${npmpackage}" # Uncomment to have NPM version alongside folder
            echo "${npmpackage}${folder/#\//:}" # Uncomment to have NPM version on its own
        fi
    else
        echo "${PWD/${HOME}/~}"
    fi
}

#PS1='\w $(__git_ps1_expand "(%s)")\$ ' # non-colored PS1
PS1='\[\033[0;32m\]$(__npm_dir_expand)\[\033[0m\]\[\033[0;31m\]$(__git_ps1_expand)\[\033[0m\] \[\033[0;33m\]\$\[\033[0m\] '

# Set node PATHs
# --------------
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

# Make sublime our editor of choice
# ---------------------------------
export EDITOR="subl -w"

# Safely include functions that are portable and don't override anything important in any PATH folders
# ----------------------------------------------------------------------------------------------------
. ~/.bash_fn_gifify
. ~/.bash_fn_git
. ~/.bash_fn_headless
. ~/.bash_fn_nano
. ~/.bash_fn_project
. ~/.bash_fn_selenium
. ~/.bash_fn_xtract
. ~/.bash_fn_briefcasewanker

# Add ALIASES
# -----------
. ~/.bash_aliases

# Add colors to LS
# ----------------
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
