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

# Npm
npm i -g npm-upgrade
npm i -g tldr

brew tap caskroom/cask            # Tap the Caskroom/Cask repository from Github using HTTPS.
brew cask install firefox
brew cask install google-chrome

# IDEs and development toolings
brew cask install sublime-text


brew search iterm2                # Searches all known Casks for a partial or exact match.
brew cask info iterm2             # Displays information about the given Cask

brew cask install iterm2          # Install the given cask.


# security and privacy
brew cask install 1password

# communication
brew cask install slack

brew cask install docker

# Remove outdated versions from the cellar.
brew cleanup


