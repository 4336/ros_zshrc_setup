# user_setup.zsh

export USER_ZSH_PATH=$(dirname $0)
export BG_COLOR=172 # check color with 'spectrum_ls' command


source $USER_ZSH_PATH/ros.zsh
source $USER_ZSH_PATH/alias.zsh


set_rosmode # setup ros ip
rosws # setup ros workspace

