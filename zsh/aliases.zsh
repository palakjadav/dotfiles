# Enable aliases to be sudo’ed
alias sudo="sudo "

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
#alias ~ = "cd ~"

# Shortcuts
alias ls="ls --color"
alias -- +x="chmod +x"
alias o="open"
alias oo="open ."
alias e="$EDITOR"

# GitHub Desktop
alias gh="github"

# git
if command -v hub &>/dev/null; then
  eval "$(hub alias -s)"      # Use hub as a git wrapper
fi
alias g='git'
alias gl='git log'
alias gll='git loglines'
alias gwc='git whatchanged'
alias gwh='git where'
alias gs='git status -sb'
alias gst='git status'
alias gc='git compare'
alias gd='git diff'
alias gds='git diff --staged'
alias gb='git branch -a -v'   # verbosely list local and remote branches
alias ga='git add'
alias gap='git add -p'        # interactively add files to index
alias gu='git unstage'        # unstage file from index, defined in ~/.gitconfig
alias gci='git commit'
alias gco='git checkout'
alias gcop='git checkout @{-1}'
alias gf='git fetch'
alias gm='git merge'
alias gr='git rebase'
alias gsm='git sm'            # git submodule
alias gsmu='git smu'          # git submodule update --init --recursive


# ForkLift
alias k="open -a ForkLift"
alias kk="open -a ForkLift ."

# Bat: https://github.com/sharkdp/bat
command -v bat >/dev/null 2>&1 && alias cat="bat --style=numbers,changes"

# trash-cli: https://github.com/sindresorhus/trash-cli
[ -d ~/dotfiles/node_modules/trash-cli ] && alias rm="~/dotfiles/node_modules/trash-cli/cli.js"

# Download file and save it with filename of remote file
alias get="curl -O -L"

# Run npm script without annoying noise
alias nr="npm run --silent"

# Jest watch
alias j="npx jest --watch"

# Make a directory and cd to it
take() {
  mkdir -p $@ && cd ${@:$#}
}

# cd into whatever is the forefront Finder window
cdf() {
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# Magic Project Opener
repo() {
  cd "$(~/dotfiles/bin/repo $1)"
}

# git clone and cd to a repo directory
clone() {
  git clone --depth=1 "$1" "$2"
  if [ "$2" ]; then
    cd "$2"
  else
    cd $(basename "$1" .git)
  fi
  npm install
}
