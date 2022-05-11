# useful alias

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
