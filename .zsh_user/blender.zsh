echo ${BLENDER_VERSION_CUR:=5.1} &> /dev/null
echo ${BLENDER_VERSION_PRE:=5.1} &> /dev/null
echo ${BLENDER_VERSION_API:=$BLENDER_VERSION_CUR} &> /dev/null

function _print_blender_dir(){
    setopt shwordsplit globsubst local_options
    local blend_dirs=($USER_APPS_DIR/blender-${1:-$BLENDER_VERSION_CUR}*-*)
    echo $blend_dirs[1]
}

alias blender="WAYLAND_DISPLAY='' $(_print_blender_dir)/blender"
alias blender_pre="WAYLAND_DISPLAY='' $(_print_blender_dir $BLENDER_VERSION_PRE)/blender"
pythonpath+=("$(_print_blender_dir $BLENDER_VERSION_API)/$BLENDER_VERSION_API/scripts/modules")
