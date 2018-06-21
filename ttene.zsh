#  _   _                            _
# | | | |                          | |
# | |_| |_ ___ _ __   ___   _______| |__
# | __| __/ _ \ '_ \ / _ \ |_  / __| '_ \
# | |_| ||  __/ | | |  __/_ / /\__ \ | | |
#  \__|\__\___|_| |_|\___(_)___|___/_| |_|
# さなちゃん作業するところ見てて…
autoload -Uz add-zsh-hook

# sigh with execute status
add-zsh-hook precmd exec_status_ttene

exec_status_ttene() {
    if [ $? -eq 0 ]; then
        ( { mplayer "voices/はーーー.mp3" } &; ) >/dev/null 2>&1
    fi
}

# ttene with new line
accept_line_ttene() {
    zle accept-line
    echo $[${RANDOM}%`ls -1 voices|grep -E 'てねっ[0-9]+.mp3$'|wc -l`] >/dev/null
    local ttene="voices/てねっ$(printf %02d $[${RANDOM}%`ls -1 voices|grep -E 'てねっ[0-9]+.mp3$'|wc -l`]).mp3"
    ( { mplayer ${ttene} } &; ) >/dev/null 2>&1
}

zle -N accept_line_ttene
bindkey "^M" accept_line_ttene
