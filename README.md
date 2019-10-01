# Dotfiles
![](./res/emacs-preview.png)

My dotfiles for various application configurations on Linux.

I am currently running Manjaro Linux with my desktop manager as KDE.

## Getting started
To get started, clone the repository.

```bash
$ git clone https://github.com/woojiahao/dotfiles.git ~/dotfiles
```

I have several parts to my system setup, for instance, I use an Ergodox EZ, so I have a script for Wally, a firmware flashing tool for the Ergodox.

## Software installation
The initial setup for my system is automated with the `./installers/setup`.

**Note:** ZSH is not installed with the script, in order for it to be installed, you can follow the instructions found [here.](https://github.com/robbyrussell/oh-my-zsh)

```bash
$ chmod +x ~/dotfiles/installers/arch-setup
$ sudo ~/dotfiles/installers/arch-setup
```

This will install all the software I use on a daily basis, for an exhaustive list of them, you can find them [here.]()

### Wally
If you use an Ergodox EZ and make use of the Wally tool provided to flash new layouts, you can use the installer script to set up a `.desktop` file to launch Wally automatically.

```bash
$ chmod +x ~/dotfiles/installers/wally/wally-setup
$ sudo ~/dotfiles/installers/wally/wally-setup
```

## Configurations
### Spacemacs
I use Spacemacs for normal text editing and web development, my `.spacemacs` configs can be found in `~/dotfiles/emacs/.spacemacs`.

The `.spacemacs` configurations should be installed along with `arch-setup`.

### ZSH
I use ZSH within my terminal due to the auto-completion features. The configurations are found in `~/dotfiles/.zshrc`.

I use the Oxide theme within ZSH, the official link to it can be found [here.](https://github.com/dikiaap/dotfiles/blob/master/.oh-my-zsh/themes/oxide.zsh-theme)

## Loading commands
In order to keep the shell files clean, commands/alias are loaded from the `/scripts` folder.

To add these scripts, add the following command to the end of your `.bashrc` or `.zshrc`.

```bash
export LINUX_HOME=~/dotfiles
export LINUX_SCRIPT=$LINUX_HOME/scripts
export LINUX_EXPECT=$LINUX_SCRIPT/expect
export SNIPPETS=~/snippets

for file in $LINUX_SCRIPT/*; do
  source $file
done
```
