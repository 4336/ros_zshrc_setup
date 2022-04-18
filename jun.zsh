# Yongjun's zsh setup

alias setup_pharos="sed -i '/devel\/setup.zsh/d' ~/.jun/ros_ws.zsh
echo source ~/pharos_ws/devel/setup.zsh >> ~/.jun/ros_ws.zsh
source ~/.jun/ros_ws.zsh"

alias setup_tele="sed -i '/devel\/setup.zsh/d' ~/.jun/ros_ws.zsh
echo source ~/pharos_tele/devel/setup.zsh >> ~/.jun/ros_ws.zsh
source ~/.jun/ros_ws.zsh"

alias setup_mobile="sed -i '/devel\/setup.zsh/d' ~/.jun/ros_ws.zsh
echo source ~/mobile_ws/devel/setup.zsh >> ~/.jun/ros_ws.zsh
source ~/.jun/ros_ws.zsh"

source ~/.jun/ros_ws.zsh

source ~/.jun/ip.zsh

# ROS master mode
alias rosmulti="export ROS_MASTER_IP=$ROS_REMOTE_IP
source ~/.jun/ros_refresh.zsh"
alias roslocal="export ROS_MASTER_IP=$ROS_HOST_IP
source ~/.jun/ros_refresh.zsh"

# ROS slave mode
export ROS_MASTER_IP=$ROS_REMOTE_IP

alias cm="roscd
cd ..
catkin_make"

roslocal


