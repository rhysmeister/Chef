#!/bin/bash
set -e;
#set -u;
set -o pipefail;

function finish() {
  s=$?;
  if [ "$s" -eq 0 ]; then
      touch "$HOME/chef-solo.success" && rm -f "$HOME/chef-solo.failed";
  else
    touch "$HOME/chef-solo.failed" && rm -f "$HOME/chef-solo.success";
  fi;
  exit $s;
}

trap finish INT TERM EXIT;

#gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
scl enable rh-ruby22 bash &
# Let's hope nothing bad happens here!
./rvm_installer.sh
source ~/.rvm/scripts/rvm;
rvm install 2.4.1;
rvm use 2.4.1@chef --create;
gem install chef && touch chef-solo.success;
