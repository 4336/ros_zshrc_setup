# Yongjun's ros zsh setup

setup_ws()
{
    echo source \$HOME/Workspaces/$1/devel/setup.zsh > $ROS_ZSHRC_PATH/ros_ws.zsh
    source $ROS_ZSHRC_PATH/ros_ws.zsh
}

source $ROS_ZSHRC_PATH/ros_ws.zsh

source $ROS_ZSHRC_PATH/ip.zsh

## ROS IP & Master-Slave Setup

# ROS master mode
alias rosmulti="export ROS_MASTER_IP=$ROS_REMOTE_IP
source $ROS_ZSHRC_PATH/ros_refresh.zsh"
alias roslocal="export ROS_MASTER_IP=$ROS_HOST_IP
source $ROS_ZSHRC_PATH/ros_refresh.zsh"

# ROS slave mode
export ROS_MASTER_IP=$ROS_REMOTE_IP

# Work In Progress: roslocal-multi fix
roslocal

source $ROS_ZSHRC_PATH/alias.zsh
