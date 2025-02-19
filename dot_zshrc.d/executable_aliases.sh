# #NVIM aliases
alias vim="nvim"
alias vi="nvim"

# ZSHRC aliases
alias szrc="source ~/.zshrc" # Source
alias vzrc="vim ~/.zshrc" # Open for editing
alias czrc="bat ~/.zshrc" # Print contents with bat

# grep aliases
alias aligrep="alias | grep" # Grep aliases, useful to search through oh-my-zsh aliases
alias igrep="grep -i" # Case insensitive grep

# Alias for Terraform
alias tf="terraform"

# Z aliases
alias ze="z -e"

# Alias npx to nlx to ensure package manager is respected for running scripts 
alias npx="nlx"

# Docker alias for terse output
alias dpss="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}'"
