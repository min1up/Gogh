#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#000000"           # Black
COLOR_02="#cc0000"           # Red
COLOR_03="#439a06"           # Green
COLOR_04="#c4a000"           # Yellow
COLOR_05="#267ad3"           # Blue
COLOR_06="#800080"           # Cyan
COLOR_07="#06989a"           # Magenta
COLOR_08="#d3d7cf"           # Light gray

COLOR_09="#000000"           # Dark gray
COLOR_10="#cc0000"           # Light Red
COLOR_11="#439a06"           # Light Green
COLOR_12="#c4a000"           # Light Yellow
COLOR_13="#267ad3"           # Light Blue
COLOR_14="#800080"           # Light Cyan
COLOR_15="#06989a"           # Light Magenta
COLOR_16="#d3d7cf"           # White

BACKGROUND_COLOR="#333439"   # Background Color
FOREGROUND_COLOR="#ffffff"   # Foreground Color (text)
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor color
PROFILE_NAME="Ambicord"
# =============================================







# =============================================================== #
# | Apply Colors
# ===============================================================|#
function gogh_colors () {
    echo ""
    echo -e "\033[0;30m█████\\033[0m\033[0;31m█████\\033[0m\033[0;32m█████\\033[0m\033[0;33m█████\\033[0m\033[0;34m█████\\033[0m\033[0;35m█████\\033[0m\033[0;36m█████\\033[0m\033[0;37m█████\\033[0m"
    echo -e "\033[0m\033[1;30m█████\\033[0m\033[1;31m█████\\033[0m\033[1;32m█████\\033[0m\033[1;33m█████\\033[0m\033[1;34m█████\\033[0m\033[1;35m█████\\033[0m\033[1;36m█████\\033[0m\033[1;37m█████\\033[0m"
    echo ""
}

function curlsource() {
    f=$(mktemp -t curlsource)
    curl -o "$f" -s -L "$1"
    source "$f"
    rm -f "$f"
}

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_PATH="$(dirname "$SCRIPT_PATH")"

gogh_colors

if [ -e $PARENT_PATH"/apply-colors.sh" ]
then
    source $PARENT_PATH"/apply-colors.sh"
else
    if [ $(uname) = "Darwin" ]; then
        # OSX ships with curl and ancient bash
        # Note: here, sourcing directly from curl does not work
        curlsource https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh
    else
        # Linux ships with wget
        source <(wget -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
    fi
fi
