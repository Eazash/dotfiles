# Configure brew autocomplete
# Must be run before compinit (i.e. sourcing oh-my-zsh.sh) 
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

