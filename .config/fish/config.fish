if status is-interactive
    # Commands to run in interactive sessions can go here

    ### ADDING TO THE PATH
    # First line removes the path; second line sets it.  Without the first line,
    # your path gets massive and fish becomes very slow.
    set -e fish_user_paths
    set -U fish_user_paths $HOME/.local/bin $HOME/Applications $HOME/Applications/bin $HOME/.cargo/bin $HOME/.surrealdb/ $fish_user_paths

    ### EXPORT ###
    set fish_greeting                   # Supresses fish's intro message
    set TERM "kitty"                    # Sets the terminal type
    set EDITOR "nvim"                   # $EDITOR use Neovim
    set VISUAL "code"                   # $VISUAL use VSCode
    set SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

    ### FUNCTIONS ###
    function mkcd
        mkdir -p $argv
        and cd $argv[-1]
    end

    ### ALIASES ### 

    # editing config file
    alias fshconf="lvim ~/.config/fish/config.fish"
    alias reload="source ~/.config/fish/config.fish"

    # file related aliases
    alias cp="cp -i"
    alias mv="mv -i"
    alias rm="rm -i"
    alias del="trash"

    # Changing "ls" to "exa"
    alias ls="exa --color=always --group-directories-first"
    alias ll="exa -lh --color=always --group-directories-first"
    alias lt="exa -aT --color=always --group-directories-first"
    alias l.="exa -a | egrep '^\.'"

    # Colorize grep output (good for log files)
    alias grep="grep --color=auto"
    alias egrep="egrep --color=auto"
    alias fgrep="fgrep --color=auto"

    # adding flags
    alias df="df -h"                                # human-readable sizes
    alias free="free -m"                            # show sizes in MB

    # utils
    alias cls="clear"                               # adds clear cmd from Windows
    alias psa="ps auxf"                             # shows all processes
    alias jctl="journalctl -p 3 -xb"                # get error messages from journalctl
    alias cleanup="paru -c"                         # clean unneeded dependencies
    alias dir-open="xdg-open . &> /dev/null"        # nice alias to open folder
    alias icat="kitty icat"                         # alias to preview images in terminal

    # get fastest mirrors
    alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
    alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
    alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
    alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

    # bare git repo alias for dotfiles
    # https://www.atlassian.com/git/tutorials/dotfiles
    alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

    # start SSH Agent 
    if test -z (pgrep ssh-agent | string collect)
        eval (ssh-agent -c)
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
    end

    # nvm
    alias nvm-node-upgrade="nvm install --lts --reinstall-packages-from=current"

    # termbin
    alias tb="nc termbin.com 9999"

    ### RANDOM COLOR SCRIPT ###
    # colorscript random
end
