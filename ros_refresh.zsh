# zsh for update ROS environment 

source $ROS_ZSHRC_PATH/ros_ws.zsh

export ROS_IP=$ROS_MASTER_IP
export ROS_MASTER_URI=http://$ROS_MASTER_IP:11311
export ROS_HOSTNAME=$ROS_HOST_IP
