#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget --with-iri


# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep

brew install git
brew install git-lfs
brew install p7zip
brew install tree

brew install node
brew install nvm
brew install dockutil

npm i -g npm-upgrade
npm i -g tldr

brew tap caskroom/cask                # Tap the Caskroom/Cask repository from Github using HTTPS.
brew cask install firefox
brew cask install google-chrome

brew cask install sublime-text        # IDEs and development toolings

brew search atom                      # Searches all known Casks for a partial or exact match.
brew cask info atom                   # Displays information about the given Cask
brew cask install atom                # Install the given cask.

brew search visual-studio-code        # Searches all known Casks for a partial or exact match.
brew cask info visual-studio-code     # Displays information about the given Cask
brew cask install visual-studio-code  # Install the given cask.

brew search iterm2                    # Searches all known Casks for a partial or exact match.
brew cask info iterm2                 # Displays information about the given Cask
brew cask install iterm2              # Install the given cask.

brew search mysqlworkbench            # Searches all known Casks for a partial or exact match.
brew cask info mysqlworkbench         # Displays information about the given Cask
brew cask install mysqlworkbench      # Install the given cask.

brew cask install 1password           # security and privacy

brew cask install slack               # communication

brew cask install docker

brew cleanup                          # Remove outdated versions from the cellar.
