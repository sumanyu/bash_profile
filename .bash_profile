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

personal_cron=$(ps aux | grep '[p]ersonal-cron')

personal_scheduler="/Users/vps/Documents/PERSONAL/personal-scheduler"

# Automatically updates crontab from personal file
if [ -z "$personal_cron" ]; then
    nohup fswatch -0 $personal_scheduler/personal-cron | xargs -0 -n1 crontab &
fi

bash_profile=$(ps aux | grep '[u]pload-bash-profile.sh')

# Automatically push bash profile when I change it
if [ -z "$personal_cron" ]; then
    nohup fswatch -0 ~/.bash_profile | xargs -0 -n1 bash $personal_scheduler/upload-bash-profile.sh > /dev/null 2>&1 &
fi

# scripts=$(ps aux | grep '[u]pload-scripts.sh')

# # Automatically commit scripts when they change
# if [ -z "$scripts" ]; then
#     nohup fswatch -0 $personal_scheduler | xargs -0 -n1 bash $personal_scheduler/upload-scripts.sh > /dev/null 2>&1 &
# fi

alias doit="/usr/bin/open -a "/Applications/Emacs.app" '/Users/vps/Dropbox/Docs/do-it.org'"
