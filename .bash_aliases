# some useful git aliases
alias g="git status"
alias gsh="git show"
alias gd="git diff"
alias ga="git add -A ."
alias gv="git commit -v"
alias gam="git commit --amend -v"
alias gfml="git add -A . && git commit --amend --no-edit && git push --force-with-lease"
alias gfr="git fetch && git rebase && tig"
alias gp="git push"
alias gpf="git push --force-with-lease"

# pbcopy and pbpaste on Linux
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
