# zsh functions for ROS configuration

### ROS Core & IP ###

set_rosmode() # load ip info
{
    ros_mode=$(cat $USER_ZSH_PATH/.ros_mode)

    if [ "$ros_mode" -eq 0 ]; then
        # ros localhost mode
        export ROS_MASTER_URI=http://localhost:11311
        export ROS_HOSTNAME="localhost"
        export ROS_IP="localhost"
    elif [ "$ros_mode" -eq 1 ]; then
        # ros master mode
        local_ip=$(cat $USER_ZSH_PATH/.local_ip)
        export ROS_MASTER_URI=http://$local_ip:11311
        export ROS_HOSTNAME=$local_ip
        export ROS_IP=$local_ip
    elif [ "$ros_mode" -eq 2 ]; then
        # ros slave mode
        target_ip=$(cat $USER_ZSH_PATH/.target_ip)
        local_ip=$(cat $USER_ZSH_PATH/.local_ip)
        export ROS_MASTER_URI=http://$target_ip:11311
        export ROS_HOSTNAME=$local_ip
        export ROS_IP=$local_ip
    else
        echo "rosmode parameter error"
    fi
}

rosmode() # echo ros mode(ip)
{
    ros_mode=$(cat $USER_ZSH_PATH/.ros_mode)

    if [ "$ros_mode" -eq 0 ]; then
        echo "ROS localhost mode"
    elif [ "$ros_mode" -eq 1 ]; then
        local_ip=$(cat $USER_ZSH_PATH/.local_ip)
        echo "ROS master($local_ip) mode"
    elif [ "$ros_mode" -eq 2 ]; then
        target_ip=$(cat $USER_ZSH_PATH/.target_ip)
        local_ip=$(cat $USER_ZSH_PATH/.local_ip)
        echo "ROS master($target_ip) slave($local_ip) mode"
    fi
}

set_rosip() #1 host ip; #2 client ip
{
    if [ $# -eq 0 ]; then
        # no parameter
        echo "0" > $USER_ZSH_PATH/.ros_mode
        echo "" > $USER_ZSH_PATH/.target_ip
        echo "" > $USER_ZSH_PATH/.local_ip
    elif [ "$#" -eq 1 ]; then
        # $1: host ip
        echo "1" > $USER_ZSH_PATH/.ros_mode
        echo "" > $USER_ZSH_PATH/.target_ip
        echo "$1" > $USER_ZSH_PATH/.local_ip
    elif [ "$#" -eq 2 ]; then
        # $1: host ip $2: client ip
        echo "2" > $USER_ZSH_PATH/.ros_mode
        echo "$1" > $USER_ZSH_PATH/.target_ip
        echo "$2" > $USER_ZSH_PATH/.local_ip
    else
        echo "Invalid number of arguments. Provide 0~2 arguments."
    fi

    set_rosmode
    rosmode
}

### ROS Workspace ###

rosws()
{
    dir=$(cat $USER_ZSH_PATH/.ros_ws)
    if [ -z "$dir" ]; then
        echo "ROS workspace has not been loaded."
    else
        source $dir/devel/setup.zsh
    fi
}

set_rosws() #1 DIR to workspace
{
    echo $1 > $USER_ZSH_PATH/.ros_ws
}

