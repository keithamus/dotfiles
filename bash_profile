# Include bash shopt options
# --------------------------
. ~/.bash_options

# Include bash completions
# ------------------------
. /usr/local/etc/bash_completion

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
    origin="`git remote | head -1`"
    if [[ "`git rev-parse HEAD`" != "`git rev-parse ${origin}/${gitps1} 2> /dev/null`" ]]; then
	   dirty="${dirty}↑"
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
#PS1='\w $(__git_ps1_expand "(%s)")\$ ' # non-colored PS1
PS1='\[\033[0;32m\]\w\[\033[0m\]\[\033[0;31m\]$(__git_ps1_expand)\[\033[0m\] \[\033[0;33m\]\$\[\033[0m\] '

# Set node PATHs
# --------------
export NODE_PATH="/usr/local/lib/node:/usr/local/lib/node_modules"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

# Make sublime our editor of choice
# ---------------------------------
export EDITOR="subl -w"

# Safely include functions that are portable and don't override anything important in any PATH folders
# ----------------------------------------------------------------------------------------------------
. ~/.bash_fn_git
. ~/.bash_fn_headless
. ~/.bash_fn_nano
. ~/.bash_fn_project
. ~/.bash_fn_xtract


# Add ALIASES
# -----------
. ~/.bash_aliases

# Add colors to LS
# ----------------
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
