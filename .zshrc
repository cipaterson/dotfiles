#
# .zshrc
#
# Don't require escaping globbing characters in zsh.
unsetopt nomatch

# Custom $PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/bin:$PATH
# This is where pip puts executibles, so needed for ansible, etc:
export PATH=$HOME/Library/Python/3.8/bin:$PATH

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

# Calm homebrew down a bit (just once a week).
export HOMEBREW_AUTO_UPDATE_SECS=604800

# Delete a given line number in the known_hosts file.
knownrm() {
 re='^[0-9]+$'
 if ! [[ $1 =~ $re ]] ; then
   echo "error: line number missing" >&2;
 else
   sed -i '' "$1d" ~/.ssh/known_hosts
 fi
}

eval "$(rbenv init - zsh)"
