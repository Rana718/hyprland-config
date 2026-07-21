# ─── Fish Shell Config ───────────────────────────────────────────────────────
# Portable config — works on Arch, Ubuntu/Debian, Fedora, NixOS, macOS

# ─── Locale ──────────────────────────────────────────────────────────────────
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# ─── PATH additions ─────────────────────────────────────────────────────────
if test -d ~/.local/bin
    fish_add_path ~/.local/bin
end

if test -d ~/go/bin
    fish_add_path ~/go/bin
end

if test -d ~/.bun/bin
    set --export BUN_INSTALL "$HOME/.bun"
    fish_add_path $BUN_INSTALL/bin
end

if test -d ~/.cargo/bin
    fish_add_path ~/.cargo/bin
end

# ─── Man pages with bat ─────────────────────────────────────────────────────
if type -q bat
    set -x MANROFFOPT "-c"
    set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
else if type -q batcat
    set -x MANROFFOPT "-c"
    set -x MANPAGER "sh -c 'col -bx | batcat -l man -p'"
end

# ─── Greeting ────────────────────────────────────────────────────────────────
function fish_greeting
    if type -q fastfetch
        fastfetch
    end
end

# ─── History with !! and !$ ──────────────────────────────────────────────────
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

# ─── Fish command history ────────────────────────────────────────────────────
function history
    builtin history --show-time='%F %T '
end

# ─── Utility functions ───────────────────────────────────────────────────────
function backup --argument filename
    cp $filename $filename.bak
end

function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | string trim --right --chars=/)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# ─── Aliases ─────────────────────────────────────────────────────────────────
# Replace ls with eza (if available)
if type -q eza
    alias ls='eza -al --color=always --group-directories-first --icons'
    alias la='eza -a --color=always --group-directories-first --icons'
    alias ll='eza -l --color=always --group-directories-first --icons'
    alias lt='eza -aT --color=always --group-directories-first --icons'
    alias l.="eza -a | grep -e '^\.'"
end

# Common use
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ─── Android SDK & Gradle ────────────────────────────────────────────────────
set -gx ANDROID_HOME /run/media/rana/DEV/andriod/sdk
set -gx GRADLE_USER_HOME /run/media/rana/DEV/andriod/gradle
fish_add_path $ANDROID_HOME/platform-tools
fish_add_path $ANDROID_HOME/cmdline-tools/latest/bin
fish_add_path $ANDROID_HOME/emulator

# ─── Zoxide (smart cd) ──────────────────────────────────────────────────────
zoxide init fish | source
alias cd='z'

# ─── Zed Editor ─────────────────────────────────────────────────────────────
alias zed='zeditor'

# ─── .profile support ────────────────────────────────────────────────────────
if test -f ~/.fish_profile
    source ~/.fish_profile
end
