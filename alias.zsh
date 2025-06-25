# useful alias

### NZXT ###
# sudo pip3 install liquidctl
alias liquid_env="source ~/Library/liquidctl/.venv/bin/activate"
alias pauto="liquidctl --match Kraken set pump speed 20 30  30 50  35 80  40 100"
alias pmax="liquidctl --match Kraken set pump speed 100"
alias p53="watch -n 0.2 liquidctl --match Kraken status"

alias fmax="liquidctl --match Fan set fan3 speed 100"
alias f53="watch -n 0.2 liquidctl --match Fan status"

alias lcc="nohup python /home/jun/Library/liquidctl/liquid_cascade_control.py \
20 20 20 \
30 40 40 \
40 80 60 \
50 100 100 > /dev/null 2>&1 &"

### Device ###
alias udev_update="sudo udevadm control --reload-rules && udevadm trigger"

alias check_serial="for sysdevpath in \$(find /sys/bus/usb/devices/usb*/ -name dev); do
    (
        syspath=\"\${sysdevpath%/dev}\"
        devname=\"\$(udevadm info -q name -p \$syspath)\"
        [[ \"\$devname\" == \"bus/\"* ]] && exit
        eval \"\$(udevadm info -q property --export -p \$syspath)\"
        [[ -z \"\$ID_SERIAL\" ]] && exit
        echo \"/dev/\$devname - \$ID_SERIAL\"
    )
done"


### Env ###
alias pip_is_pip2="sudo mv /usr/local/bin/pip.backup /usr/local/bin/pip"
alias pip_is_pip3="sudo mv /usr/local/bin/pip /usr/local/bin/pip.backup"
alias pipv="pip --version"

alias python_is_python2="sudo ln -sf /usr/bin/python2 /usr/bin/python"
alias python_is_python3="sudo ln -sf /usr/bin/python3 /usr/bin/python"
alias pythonv="python --version"


### Docker ###

new_container()
{
    docker run "$@" \
    -it --privileged \
    --hostname docker \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /home/jun/Documents:/home/jun/Documents \
    -v /var/run/docker.sock:/var/run/docker.sock \
    ubuntu:cuda-devel
}
alias ubuntu-cuda-devel="docker start $ && docker exec -it ubuntu-cuda-devel /bin/zsh"

alias docker-display="xhost +local:"

alias LTS18-NV11.0-PyTorch="docker start LTS18-NV11.0-PyTorch && docker exec -it LTS18-NV11.0-PyTorch /bin/zsh"

alias doc-nvidia-smi="sudo docker run --rm --gpus all nvidia/cuda:11.0.3-base-ubuntu20.04 nvidia-smi"


### ROS ###
alias cm="roscd
cd ..
catkin_make"

alias gitup="git pull
git add .
git commit -m \"jun\"
git push"

alias use_sim="rosparam set /use_sim_time true"
alias use_now="rosparam set /use_sim_time false"
alias is_sim="rosparam get /use_sim_time"


### CARLA ###

alias carla="/opt/carla-simulator/./CarlaUE4.sh -RenderOffScreen"

export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH

export UE4_ROOT=~/CARLA/UnrealEngine_4.26

export CARLA_ROOT=~/CARLA/carla
alias carla_cd="cd $CARLA_ROOT"
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/agents:${CARLA_ROOT}/PythonAPI/carla

carla_reinstall(){
    if [ $# -eq 0 ]; then
        echo "no version info"
    elif [ $# -eq 1 ]; then
        if [ ! -e $CARLA_ROOT/PythonAPI/carla/dist/carla-$1-cp38-cp38-linux_x86_64.whl ]; then
            cd $CARLA_ROOT
            make PythonAPI
        fi
        pip uninstall carla -y
        pip install $CARLA_ROOT/PythonAPI/carla/dist/carla-$1-cp38-cp38-linux_x86_64.whl
    else
        echo "too many args"
    fi
}

darla(){
    if [ $# -eq 0 ]; then
        echo "no version info"
    elif [ $# -eq 1 ]; then
        docker run --rm --name carla --privileged --gpus all --net=host \
            -v /tmp/.X11-unix:/tmp/.X11-unix:rw carlasim/carla:$1 \
            /bin/bash ./CarlaUE4.sh -RenderOffScreen &
    else
        echo "too many args"
    fi
}
alias stop_carla="docker stop carla &"


### ETC ###

alias ez="subl ~/.zshrc"
alias sz="source ~/.zshrc"

alias GD="google-drive-ocamlfuse ~/Documents/GoogleDrive"

fix_kazam(){
    ffmpeg -y -i "$1" -c:v libx264 -c:a aac -strict experimental -tune fastdecode -pix_fmt yuv420p -b:a 192k -ar 48000 "$2"
}

alias sleep="sudo systemctl hibernate"

nohup_wget(){
    nohup wget "$1" -O "$2" -c > /dev/null 2>&1 &
}

