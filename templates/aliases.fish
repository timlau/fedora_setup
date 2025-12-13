# This file is managed by Ansible. Do not edit manually.

# Define aliases (which are functions in fish)
function ll --wraps 'ls' --description 'alias ll=ls -lhA'
    ls -lhA $argv
end

function gco --wraps 'git' --description 'alias gco=git checkout'
    git checkout $argv
end

function cat --wraps 'bat' --description 'alias cat=bat'
    bat $argv
end

function lg --wraps 'lazygit' --description 'alias lg=lazygit'
    lazygit $argv
end

function vi --wraps 'nvim' --description 'alias vi=nvim'
    nvim $argv
end

function upd --description 'update dotfiles to/from github'
    cd ~/udv/github/dotfiles
    git commit -a -m "update config"
    git pull --rebase origin main
    git push
    cd -
end
