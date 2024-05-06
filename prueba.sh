max() {
    echo -e "$1\n$2" | sort -n | tail -1
}

getbiggestword() {
    echo "$@" | sed "s/ /\n/g" | wc -L
}

replicate() {
    local n="$1"
    local x="$2"
    local str

    for _ in $(seq 1 "$n"); do
        str="$str$x"
    done
    echo "$str"
}

programchoices() {
    choices=()
    local maxlen; maxlen="$(getbiggestword "${!checkboxes[@]}")"
    linesize="$(max "$maxlen" 42)"
    local spacer; spacer="$(replicate "$((linesize - maxlen))" " ")"

    for key in "${!checkboxes[@]}"
    do
        # A portable way to check if a command exists in $PATH and is executable.
        # If it doesn't exist, we set the tick box to OFF.
        # If it exists, then we set the tick box to ON.
        if ! command -v "${checkboxes[$key]}" > /dev/null; then
            # $spacer length is defined in the individual window functions based
            # on the needed length to make the checkbox wide enough to fit window.
            choices+=("${key}" "${spacer}" "OFF")
        else
            choices+=("${key}" "${spacer}" "ON")
        fi
    done
}

selectedprograms() {
    result=$(
        # Creates the whiptail checklist. Also, we use a nifty
        # trick to swap stdout and stderr.
        whiptail --title "$title"                               \
                 --checklist "$text" 22 "$((linesize + 16))" 12 \
                 "${choices[@]}"                                \
                 3>&2 2>&1 1>&3
    )
}

exitorinstall() {
    exitstatus=$?
    # Check the exit status, if 0 we will install the selected
    # packages. A command which exits with zero (0) has succeeded.
    # A non-zero (1-255) exit status indicates failure.
    if [ $exitstatus = 0 ]; then
        # Take the results and remove the "'s and add new lines.
        # Otherwise, pacman is not going to like how we feed it.
        programs=$(echo "$result" | sed 's/" /\n/g' | sed 's/"//g' )
        echo "$programs"
        sudo pacman --needed --ask 4 -Sy "$programs" || \
        echo "Failed to install required packages."
    else
        echo "User selected Cancel."
    fi
}

browsers () {
    title="Web Browsers"
    text="Select one or more web browsers to install.\nAll programs marked with '*' are already installed.\nUnselecting them will NOT uninstall them."
    spacer=$(for i in $(seq 1 38); do echo -n " "; done)

    local -A checkboxes
    checkboxes["brave-bin"]="brave"
    checkboxes["chromium"]="chromium"
    checkboxes["firefox"]="firefox"
    checkboxes["google-chrome"]="google-chrome-stable"
    checkboxes["icecat"]="icecat"
    checkboxes["librewolf"]="librewolf"
    checkboxes["microsoft-edge-stable-bin"]="microsoft-edge-stable"
    checkboxes["mullvad-browser-bin"]="mullvad-browser"
    checkboxes["qutebrowser"]="qutebrowser"
    checkboxes["ungoogled-chromium"]="ungoogled-chromium"
    checkboxes["vivaldi"]="vivaldi"

    programchoices && selectedprograms && exitorinstall
}

otherinternet () {
    title="Other Internet Programs"
    text="Other Internet programs available for installation.\nAll programs marked with '*' are already installed.\nUnselecting them will NOT uninstall them."
    spacer=$(for i in $(seq 1 47); do echo -n " "; done)

    local -A checkboxes
    checkboxes["deluge"]="deluge"
    checkboxes["discord"]="discord"
    checkboxes["element-desktop"]="element-desktop"
    checkboxes["filezilla"]="filezilla"
    checkboxes["geary"]="geary"
    checkboxes["hexchat"]="hexchat"
    checkboxes["jitsi-meet-desktop"]="jitsi-meet-desktop"
    checkboxes["mailspring"]="mailspring"
    checkboxes["telegram-desktop"]="telegram"
    checkboxes["thunderbird"]="thunderbird"
    checkboxes["transmission-gtk"]="transmission-gtk"

    programchoices && selectedprograms && exitorinstall
}

multimedia() {
    title="Multimedia Programs"
    text="Multimedia programs available for installation.\nAll programs marked with '*' are already installed.\nUnselecting them will NOT uninstall them."
    spacer=$(for i in $(seq 1 53); do echo -n " "; done)

    local -A checkboxes
    checkboxes["blender"]="blender"
    checkboxes["deadbeef"]="deadbeef"
    checkboxes["gimp"]="gimp"
    checkboxes["inkscape"]="inkscape"
    checkboxes["kdenlive"]="kdenlive"
    checkboxes["krita"]="krita"
    checkboxes["mpv"]="mpv"
    checkboxes["obs-studio"]="obs"
    checkboxes["rhythmbox"]="rhythmbox"
    checkboxes["ristretto"]="ristretto"
    checkboxes["vlc"]="vlc"

    programchoices && selectedprograms && exitorinstall
}

