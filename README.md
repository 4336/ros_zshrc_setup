## zshrc file for ros workspace setup

### setup zsh

`sudo apt install zsh git curl -y`

`which zsh`

`chsh -s $(which zsh)`

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

### setup zshrc

`git clone git@github.com:4336/ros_zshrc_setup.git ~/.$USER`

`echo "source ~/.\$USER/user_setup.zsh" >> ~/.zshrc`

`source ~/.zshrc`

