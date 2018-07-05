#  _   _                            _
# | |_| |_ ___ _ __   ___   _______| |__
# | __| __/ _ \ '_ \ / _ \ |_  / __| '_ \
# | |_| ||  __/ | | |  __/_ / /\__ \ | | |
#  \__|\__\___|_| |_|\___(_)___|___/_| |_|
# さなちゃん作業するところ見てて…
autoload -Uz add-zsh-hook

# Tell me your voices folder
export TTENE_DIR=$(cd $(dirname $0); pwd)

# select mplayer or afplay
[ -e afplay ] && export TTENE_PLAYER=afplay || export TTENE_PLAYER=mplayer

# sigh with execute status
#add-zsh-hook precmd exec-status-ttene

#exec-status-ttene() {
#    if [ $? -eq 0 ]; then
#        ( { $TTENE_PLAYER "voices/はーーー.mp3" } &; ) >/dev/null 2>&1
#    fi
#}

# ttene with new line
accept-line-ttene() {
    zle accept-line
    local voices=(`ls -1 ${TTENE_DIR}/voices|grep -E 'てねっ[0-9]+'|xargs`)
    local choice=$[${RANDOM}%${#voices[@]}+1]
    ( { $TTENE_PLAYER "${TTENE_DIR}/voices/${voices[$choice]}" } &; ) >/dev/null 2>&1
}

zle -N accept-line-ttene
bindkey "^M" accept-line-ttene
