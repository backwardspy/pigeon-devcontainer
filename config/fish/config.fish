fish_add_path -g ~/.local/bin

set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_RUNTIME_DIR $HOME/.run

set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -gx LESSHISTFILE $XDG_STATE_HOME/less/history
set -gx MYPY_CACHE_DIR $XDG_CACHE_HOME/mypy
set -gx TERMINFO $XDG_DATA_HOME/terminfo
set -gx TERMINFO_DIRS $XDG_DATA_HOME/terminfo:/usr/share/terminfo
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup

set -gx EDITOR nvim

fish_add_path -g $CARGO_HOME/bin

set -gx LS_COLORS (vivid generate catppuccin-latte)

function eza --wraps eza
    command eza --icons --git --group-directories-first --hyperlink $argv
end
abbr ls eza
abbr la eza -a
abbr ll eza -l
abbr lla eza -la
abbr lt eza -T

abbr ga git add
abbr gb git branch
abbr gc git commit
abbr gcm git checkout main
abbr gco git checkout
abbr gd git diff
abbr gdt git difftool
abbr gl git pull
abbr gp git push
abbr gr git rebase
abbr gra git rebase --abort
abbr grc git rebase --continue
abbr gs git switch
abbr gst git status

abbr pa poetry add
abbr pad poetry add --group dev
abbr pi poetry install
abbr pr poetry run
abbr psh poetry shell

abbr vn python -m venv .venv
abbr va . .venv/bin/activate.fish
abbr vd deactivate

direnv hook fish | source

function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

if string match -q "$TERM_PROGRAM" "vscode"
    set -e VSCODE_SHELL_INTEGRATION
    . (code --locate-shell-integration-path fish)
end
