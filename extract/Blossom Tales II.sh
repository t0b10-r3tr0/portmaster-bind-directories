#!/bin/bash

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
elif [ -d "$XDG_DATA_HOME/PortMaster/" ]; then
  controlfolder="$XDG_DATA_HOME/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt
source $controlfolder/tasksetter
[ -f "${controlfolder}/mod_${CFW_NAME}.txt" ] && source "${controlfolder}/mod_${CFW_NAME}.txt"
get_controls

GAMEDIR="/$directory/ports/blossomtales2"
cd "$GAMEDIR/gamedata"

# Grab text output...
$ESUDO chmod 666 /dev/tty0
printf "\033c" > /dev/tty0
echo "Loading... Please Wait." > /dev/tty0

# Setup mono
monodir="$HOME/mono"
monofile="$controlfolder/libs/mono-6.12.0.122-aarch64.squashfs"
$ESUDO mkdir -p "$monodir"
$ESUDO umount "$monofile" || true
$ESUDO mount "$monofile" "$monodir"

# Setup savedir linux
mkdir -p "$GAMEDIR/savedata/linux"
bind_directories ~/.local/share/Blossom\ Tales\ 2 "$GAMEDIR/savedata/linux"

# Setup savedir windows
mkdir -p "$GAMEDIR/savedata/windows"
bind_directories ~/.config/Blossom\ Tales\ 2 "$GAMEDIR/savedata/windows"

# Remove all the dependencies in favour of system libs - e.g. the included 
# Custom version of FNA included with patcher- v23, but with VorbisFile-CS added back (from v16)
# see https://github.com/JohnnyonFlame/FNAHacks/tree/Shipwreck
rm -f System*.dll mscorlib.dll FNA.dll Mono.*.dll

# Setup path and other environment variables
export MONO_PATH="$GAMEDIR/dlls"
#export LD_LIBRARY_PATH="$GAMEDIR/libs:/usr/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="$GAMEDIR/libs:/usr/config/emuelec/lib32:/usr/lib32:$LD_LIBRARY_PATH"
export PATH="$monodir/bin:$PATH"

export FNA3D_FORCE_DRIVER=OpenGL
export FNA3D_OPENGL_FORCE_ES3=1
export FNA3D_OPENGL_FORCE_VBO_DISCARD=1

$ESUDO chmod 666 /dev/tty1
$ESUDO chmod 666 /dev/uinput

$GPTOKEYB "mono" &
$TASKSET mono BlossomTales2.exe 2>&1 | tee /dev/tty0 $GAMEDIR/log.txt

$ESUDO kill -9 $(pidof gptokeyb)
$ESUDO systemctl restart oga_events &
$ESUDO umount "$monodir"
unset LD_LIBRARY_PATH

# Disable console
printf "\033c" > /dev/tty1
printf "\033c" > /dev/tty0


