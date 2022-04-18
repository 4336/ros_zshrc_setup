## zshrc file for ros workspace setup

git clone git@github.com:4336/ros_zshrc_setup.git ~/.$USER

echo "ROS_ZSHRC_PATH=\\$HOME/.\\$USER" >> ~/.zshrc

source ~/.zshrc

echo "# host name  
export ROS_HOST_IP=localhost  
export ROS_REMOTE_IP=192.168.2.200" >> $HOME/.$USER/ip.zsh

echo "source \\$ROS_ZSHRC_PATH/ros_setup.zsh" >> ~/.zshrc

source ~/.zshrc
