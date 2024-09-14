# If machine is @macbook.local
if [[ $HOST == "macbook.local" ]]; then
  export ANDROID_SDK_ROOT=/Users/toniop/Library/Android/sdk
  export GPG_TTY=$(tty)

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

fi
