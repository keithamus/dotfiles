# Git Abbreviations
abbr g 'git'
abbr ga 'git add -p'
abbr gpf 'git push --force-with-lease'
abbr gpr 'hub pull-request -o'
abbr gcm 'git commit --message '
abbr gc 'git commit'
abbr gcan 'git commit --amend --no-edit'
abbr gfcm 'git fetch --all --prune; and git branch --merged origin/master | tail -n +2 | xargs git branch -d; and git checkout origin/master'
abbr grim 'git fetch; and git rebase -i origin/master'
abbr gcl 'git clone git@github.com:'
abbr gba 'git checkout -b (git log --format=%s | head -1 | tr -cs \[:alnum:\] '-' | tr \[:upper:\] \[:lower:\] | sed \'s/-$//\')'

# nvim Abbreviations!
abbr nf 'nvim (fzf)'


# npm Abbrevations!
abbr npt 'npm test'
abbr nps 'npm start'
abbr npr 'npm run'
abbr npb 'npm run build --'
abbr npl 'npm run lint --'
abbr npit 'npm it'

