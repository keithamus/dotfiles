# ===========================
# Helper methods
# ===========================
function _findup -d "Find a file, walking up the current dir to the top"
    set -l file $argv[1]
    set -l dir (pwd)
    while [ $dir != "/" ];
        if [ -e "$dir/$file" ]
            echo $dir
            return 0
        end
        set dir (dirname $dir)
    end
    return 1
end

set -g _prompt_segment__color "NONE"
set -g _prompt_segment_separatorglyph \uE0B0' '
function _prompt_segment -d "Function to draw a segment"
    if [ $_prompt_segment__color != "NONE" ]
        set_color $_prompt_segment__color -b $argv[1]
        echo -n $_prompt_segment_separatorglyph
    end
    set -g _prompt_segment__color $argv[1]
    set_color $argv[2] -b $argv[1]
    echo -n $argv[3]
end
set -g _prompt_segment_finishglyph ' '
function _prompt_finish -d "Function to draw a segment"
    set_color $_prompt_segment__color -b normal
    echo -n $_prompt_segment_separatorglyph$_prompt_segment_finishglyph
    set -g _prompt_segment__color "NONE"
    set_color normal -b normal
end


# ===========================
# Theme components
# ===========================

set -g _prompt_exitstatus_enabled 1
set -g _prompt_exitstatus_backcolor black
set -g _prompt_exitstatus_badglyph \u2716
set -g _prompt_exitstatus_badcolor red
set -g _prompt_exitstatus_goodglyph ''
set -g _prompt_exitstatus_goodcolor green
function _prompt_exitstatus -d "Show stauts of last commands exit code"
    if [ $_prompt_exitstatus_enabled -gt 0 ]
        if [ $argv[1] -ne 0 ]
          _prompt_segment $_prompt_exitstatus_backcolor $_prompt_exitstatus_badcolor $_prompt_exitstatus_badglyph
        else if [ -n $_prompt_exitstatus_goodglyph ]
          _prompt_segment $_prompt_exitstatus_backcolor $_prompt_exitstatus_goodcolor $_prompt_exitstatus_badglyph
        end
    end
end

set -g _prompt_jobstatus_enabled 1
set -g _prompt_jobstatus_backcolor black
set -g _prompt_jobstatus_jobsglyph \u2699
set -g _prompt_jobstatus_jobscolor cyan
set -g _prompt_jobstatus_nojobsglyph ''
set -g _prompt_jobstatus_nojobscolor cyan
function _prompt_jobstatus -d "Show status of background jobs"
    if [ $_prompt_sudostatus_enabled -gt 0 ]
        if [ (jobs -l | wc -l) -gt 0 ]
            _prompt_segment $_prompt_jobstatus_backcolor $_prompt_jobstatus_jobscolor $_prompt_jobstatus_jobsglyph
        else if [ -n $_prompt_jobstatus_nojobsglyph ]
            _prompt_segment $_prompt_jobstatus_backcolor $_prompt_jobstatus_nojobscolor $_prompt_jobstatus_nojobsglyph
        end
    end
end

set -g _prompt_user_enabled 1
set -g _prompt_user_backcolor 42530C
set -g _prompt_user_color white
set -g _prompt_user_showhostname 1
set -g _prompt_user_defaultuser 'keith'
function _prompt_user -d "Show user and hostname"
    if [ $_prompt_user_enabled -gt 0 ]
        if [ "$USER" != "$_prompt_user_defaultuser" -o -n "$SSH_CLIENT" ]
            if [ $_prompt_user_showhostname ]
                set USER_PROMPT (whoami)@(hostname)
            else
                set USER_PROMPT (whoami)
            end
            _prompt_segment $_prompt_user_backcolor $_prompt_user_color $USER_PROMPT
        end
    end
end

set -g _prompt_git_enabled 1
set -g _prompt_git_color white
set -g _prompt_git_backcolor 004000
set -g _prompt_git_backcolordirty 400000
set -g _prompt_git_backcolorrebase A1630D
set -g _prompt_git_detatchedglyph \u254F' '
set -g _prompt_git_branchglyph \uE0A0' '
set -g _prompt_git_rebaseglyph \u21DE' '
set -g _prompt_git_showsync 1
set -g _prompt_git_topushglyph \u2191
set -g _prompt_git_topullglyph \u2193
set -g _prompt_git_topushpullglyph ' '\u21F5' '
function _prompt_git -d "Show status of git"
    if [ $_prompt_git_enabled -gt 0 ]
        command git rev-parse --is-inside-work-tree > /dev/null 2>&1
        if [ $status -eq 0 ]
            set -l backcolor $_prompt_git_backcolor
            set -l dirty (command git status -s --untracked-files=no --ignore-submodules=dirty ^ /dev/null)
            set -l isrebasing (command ls (git rev-parse --git-dir) | grep rebase)
            set -l branch (command git symbolic-ref --short HEAD 2> /dev/null)
            set -l detatched $status
            set -l glyph $_prompt_git_branchglyph
            set -l topush ''

            if [ -n "$dirty" ]
                set backcolor $_prompt_git_backcolordirty
            end
            if [ $detatched -gt 0 ]
                set branch (command git show-ref --head -s --abbrev |head -n1 ^ /dev/null)
                set glyph $_prompt_git_detatchedglyph
            end
            if [ $isrebasing ]
                set branch (cat (git rev-parse --git-dir)/rebase*/head-name | head -1 | sed 's|refs/heads/||')
                set glyph $_prompt_git_rebaseglyph
                set backcolor $_prompt_git_backcolorrebase
            end
            if [ $_prompt_git_showsync ]
                set -l commitsahead (git rev-list --left-right "@\{u\}"... ^ /dev/null | grep '^>' | wc -l | sed "s| ||g")
                set -l commitsbehind (git rev-list --left-right "@\{u\}"... ^ /dev/null | grep '^<' | wc -l | sed "s| ||g")
                if [ $commitsahead -ne 0 -a $commitsbehind -ne 0 ]
                    set topush " $commitsbehind$_prompt_git_topushpullglyph$commitsahead"
                else if [ $commitsbehind -ne 0 ]
                    set topush " $commitsbehind$_prompt_git_topullglyph"
                else if [ $commitsahead -ne 0 ]
                    set topush " $_prompt_git_topushglyph$commitsahead"
                end
            end
            _prompt_segment $backcolor $_prompt_git_color "$glyph$branch$topush"
        end
    end
end

set -g _prompt_npm_enabled 1
set -g _prompt_npm_backcolor 990000
set -g _prompt_npm_color white
function _prompt_npm -d "Show status of npm"
    if [ $_prompt_npm_enabled -gt 0 ]
        set -l npms (npm ls --depth=-1 --long . --loglevel silent | head -1)
        if [ -n "$npms" ]
            _prompt_segment $_prompt_npm_backcolor $_prompt_npm_color $npms
        end
    end
end

set -g _prompt_sudostatus_enabled 1
set -g _prompt_sudostatus_backcolor 384656
set -g _prompt_sudostatus_sudoglyph '#'
set -g _prompt_sudostatus_sudocolor FF9000
set -g _prompt_sudostatus_nosudoglyph '$'
set -g _prompt_sudostatus_nosudocolor FF9000
function _prompt_sudostatus -d "Show status of sudo"
    if [ $_prompt_sudostatus_enabled -gt 0 ]
        # if superuser (uid == 0)
        set -l uid (id -u $USER)
        if [ $uid -eq 0 ]
            _prompt_segment $_prompt_sudostatus_backcolor $_prompt_sudostatus_sudocolor $_prompt_sudostatus_sudoglyph
        else if [ -n $_prompt_sudostatus_nosudoglyph ]
            _prompt_segment $_prompt_sudostatus_backcolor $_prompt_sudostatus_nosudocolor $_prompt_sudostatus_nosudoglyph
        end
    end
end

# ===========================
# Apply theme
# ===========================

function fish_prompt
    set_color white -b black
    _prompt_exitstatus $status
    _prompt_jobstatus
    _prompt_user
    _prompt_npm
    _prompt_git
    _prompt_sudostatus
    _prompt_finish
end
