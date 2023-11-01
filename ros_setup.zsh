# Yongjun's ros zsh setup

set_rosmode()
{
    ros_mode=$(cat $ROS_ZSHRC_PATH/.ros_mode)

    # 값이 1인지 확인
    if [ "$ros_mode" -eq 0 ]; then
        # ros localhost mode
        export ROS_IP="localhost"
        export ROS_MASTER_URI=http://localhost:11311
        export ROS_HOSTNAME="localhost"
    elif [ "$ros_mode" -eq 1 ]; then
        # ros master mode
        local_ip=$(cat $ROS_ZSHRC_PATH/.local_ip)
        export ROS_IP=$local_ip
        export ROS_MASTER_URI=http://localhost:11311
        export ROS_HOSTNAME=$local_ip
    elif [ "$ros_mode" -eq 2 ]; then
        # ros slave mode
        target_ip=$(cat $ROS_ZSHRC_PATH/.target_ip)
        local_ip=$(cat $ROS_ZSHRC_PATH/.local_ip)
        export ROS_IP=$local_ip
        export ROS_MASTER_URI=http://$target_ip:11311
        export ROS_HOSTNAME=$local_ip
    else
        echo "rosmode parameter error"
    fi
}

rosmode()
{
    ros_mode=$(cat $ROS_ZSHRC_PATH/.ros_mode)

    if [ "$ros_mode" -eq 0 ]; then
        echo "ROS localhost mode"
    elif [ "$ros_mode" -eq 1 ]; then
        local_ip=$(cat $ROS_ZSHRC_PATH/.local_ip)
        echo "ROS master($local_ip) mode"
    elif [ "$ros_mode" -eq 2 ]; then
        target_ip=$(cat $ROS_ZSHRC_PATH/.target_ip)
        local_ip=$(cat $ROS_ZSHRC_PATH/.local_ip)
        echo "ROS master($target_ip) slave($local_ip) mode"
    fi
}

set_rosip()
{
    # 매개변수의 수를 확인
    if [ $# -eq 0 ]; then
        echo "0" > $ROS_ZSHRC_PATH/.ros_mode
        echo "" > $ROS_ZSHRC_PATH/.target_ip
        echo "" > $ROS_ZSHRC_PATH/.local_ip
    elif [ "$#" -eq 1 ]; then
        # $1: host ip
        echo "1" > $ROS_ZSHRC_PATH/.ros_mode
        echo "" > $ROS_ZSHRC_PATH/.target_ip
        echo "$1" > $ROS_ZSHRC_PATH/.local_ip
    elif [ "$#" -eq 2 ]; then
        # $1: host ip $2: client ip
        echo "2" > $ROS_ZSHRC_PATH/.ros_mode
        echo "$1" > $ROS_ZSHRC_PATH/.target_ip
        echo "$2" > $ROS_ZSHRC_PATH/.local_ip
    else
        echo "Invalid number of arguments. Provide 0~2 arguments."
    fi

    set_rosmode
    rosmode
}

set_ws()
{
    echo source \$HOME/Workspaces/$1/devel/setup.zsh > $ROS_ZSHRC_PATH/ros_ws.zsh
    source $ROS_ZSHRC_PATH/ros_ws.zsh
}

set_rosmode # setup ros ip

source $ROS_ZSHRC_PATH/ros_ws.zsh # setup ros workspace

source $ROS_ZSHRC_PATH/alias.zsh # setup alias
