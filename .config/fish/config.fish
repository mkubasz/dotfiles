set TERM "tmux-256color"

if test -n "$DESKTOP_SESSION"
    set -x (gnome-keyring-daemon --start | string split "=")
end

if status is-interactive
  if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
     exec startx -- -keeptty
    end
  end
  if not set -q TMUX
   exec tmux
  end

  # Changing "ls" to "exa"
  alias ls='exa -al --color=always --group-directories-first' # my preferred listing
  alias la='exa -a --color=always --group-directories-first'  # all files and dirs
  alias ll='exa -l --color=always --group-directories-first'  # long format
  alias lt='exa -aT --color=always --group-directories-first' # tree listing
  alias l.='exa -a | egrep "^\."'


  # git
  alias addup='git add -u'
  alias addall='git add .'
  alias branch='git branch'
  alias checkout='git checkout'f
  alias clone='git clone'
  alias commit='git commit -m'
  alias fetch='git fetch'
  alias pull='git pull origin'
  alias push='git push origin'
  alias tag='git tag'
  alias newtag='git tag -a'

end

alias pau='paru -Syu'

# neovim
alias vim nvim
set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx GTK_THEME Arc-Dark-solid
#set -gx CHROME_EXECUTABLE /usr/bin/brave

set NPM_PACKAGES $HOME/.npm-packages
set -gx TMUX_PLUGIN_MANAGER_PATH $HOME/.config/tmux/plugins/
fish_add_path $HOME/.npm-packages
fish_add_path $NPM_PACKAGES/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
# fnm
fish_add_path $HOME/.fnm
fish_add_path $HOME/go/bin
fnm env | source

set -U fish_user_paths ~/.npmbin/bin $fish_user_paths
# starship
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/tumnus/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
set -gx CHROME_EXECUTABLE /usr/bin/brave

gpgconf --launch gpg-agent
set -gx GPG_TTY (tty)
#set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
