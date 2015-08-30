PATH=$PATH:~/bin
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

# Automatically updates crontab from personal file
nohup fswatch -0 /Users/vps/Documents/PERSONAL/scripts/personal-cron | xargs -0 -n1 crontab &
