# Alias commands to include common flags
alias ipython "ipython --no-banner"
alias root "root -l"
alias nvim "nvim -p";
alias vim "vim -p"

alias rm "rm -i"
alias cp "cp -i"
alias mv "mv -i"
alias mkdir "mkdir -p"
alias du "du -hs"
if which exa > /dev/null 2>&1
  alias ls "exa"
  alias la "exa -aghl --git"
end

# Abbreviate commonly used functions
# An abbreviation will expand after <space> or <Enter> is hit
abbr o bopen
abbr b bat
abbr g git
abbr gx gitx
abbr gho "github_open ."
abbr ghoi "github_open issues"
abbr ghopr "github_open pulls"
abbr p python
abbr ip ipython
abbr be "bundle exec"
abbr r root
abbr tb tbrowser
abbr v vim
abbr nv nvim
abbr ospdf "open -a Skim *.pdf"
abbr m make
abbr dbg 'set CMTCONFIG $CMTDEB'

abbr gia "git add"
abbr gb "git branch"
abbr gco "git checkout"
abbr gcl "git clone"
abbr gc "git commit"
abbr gcm "git commit -m"
abbr gwd "git diff"
abbr gws "git status -s -b"
abbr gs "git stash"
abbr gsp "git stash pop"
abbr gsx "git stash drop"
abbr gssp "git stash show -p"
abbr grb "git rebase"
abbr grbi "git rebase -i"
abbr grbc "git rebase --continue"
abbr grba "git rebase --abort"
abbr gr "git reset"
