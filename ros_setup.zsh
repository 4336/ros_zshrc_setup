# Yongjun's ros zsh setup

alias setup_pharos="sed -i '/devel\/setup.zsh/d' $ROS_ZSHRC_PATH/ros_ws.zsh
echo source \$HOME/pharos_ws/devel/setup.zsh >> $ROS_ZSHRC_PATH/ros_ws.zsh
source $ROS_ZSHRC_PATH/ros_ws.zsh"

alias setup_tele="sed -i '/devel\/setup.zsh/d' $ROS_ZSHRC_PATH/ros_ws.zsh
echo source \$HOME/pharos_tele/devel/setup.zsh >> $ROS_ZSHRC_PATH/ros_ws.zsh
source $ROS_ZSHRC_PATH/ros_ws.zsh"

alias setup_mobile="sed -i '/devel\/setup.zsh/d' $ROS_ZSHRC_PATH/ros_ws.zsh
echo source \$HOME/mobile_ws/devel/setup.zsh >> $ROS_ZSHRC_PATH/ros_ws.zsh
source $ROS_ZSHRC_PATH/ros_ws.zsh"

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

alias cm="roscd
cd ..
catkin_make"

roslocal
