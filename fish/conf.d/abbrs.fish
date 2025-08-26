# Git Abbreviations
abbr g git
abbr gs 'git st'
abbr ga 'git add -p'
abbr gpf 'git push --force-with-lease'
abbr gpu 'git push --set-upstream origin (git rev-parse --abbrev-ref HEAD); and hub compare;'
abbr gpk 'git push --set-upstream keithamus (git rev-parse --abbrev-ref HEAD); and hub compare;'
abbr gpr 'hub pull-request -o'
abbr gcm 'git commit --message'
abbr gcw 'git commit --message \'WIP!\''
abbr gc 'git commit'
abbr gcan 'git commit --amend --no-edit'
abbr gf 'git fetch --all --prune'
abbr gfcm 'git fetch --all --prune; and git checkout origin/main'
abbr gfrm 'git fetch --all --prune; and git rebase -i origin/main'
abbr gcl 'git clone git@github.com:'
abbr gba 'git checkout -b (git log --format=%s | head -1 | tr -cs \[:alnum:\] "-" | tr \[:upper:\] \[:lower:\] | sed \'s/-$//\' | sed \'s/^-//\')'

# nvim Abbreviations!
abbr nf 'nvim (fzf)'
abbr ng 'nvim (git status --porcelain | grep "^UU" | head -1 | cut -f2 -d" ")'

# npm Abbrevations!
abbr npt 'npm test'
abbr nps 'npm start'
abbr npr 'npm run'
abbr npb 'npm run build --'
abbr npl 'npm run lint --'
abbr npit 'npm it'

# journal
abbr jim 'nvim ~/Journal/(date +%Y)/(date +%Y-%m-%d).md +\'!mkdir -p %:h\' +w +i'

# mise
abbr m 'mise'
abbr mr 'mise r'
