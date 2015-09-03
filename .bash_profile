PATH=~/bin:/usr/local/bin:$PATH
export PATH

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export VISUAL=nano;

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

# The next line updates PATH for the Google Cloud SDK.
source '/Users/vps/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/vps/google-cloud-sdk/completion.bash.inc'

personal_scheduler="/Users/vps/Documents/PERSONAL/personal-scheduler"

bash_profile=$(ps aux | grep '[u]pload-bash-profile.sh')

# Automatically push bash profile when I change it
if [ -z "$bash_profile" ]; then
    nohup fswatch -0 ~/.bash_profile | xargs -0 -n1 bash $personal_scheduler/scripts/upload-bash-profile.sh > /dev/null 2>&1 &
fi

alias doit="/usr/bin/open -a "/Applications/Emacs.app" '/Users/vps/Dropbox/Docs/do-it.org'"
alias bp="nano ~/.bash_profile"
