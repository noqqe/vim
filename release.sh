#!/usr/bin/env bash

TEMP=$(mktemp -d)

# Repo
echo "# Cloning release"
git clone -q https://github.com/noqqe/vim $TEMP
rm -rf $TEMP/.git

# Initialize Plugin Manager
echo "# Plugin manager"
mkdir $TEMP/autoload
curl --silent -fLo $TEMP/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "downloaded."

# Download Plugin
echo "# Plugins"
mkdir $TEMP/plugged
for x in $(grep ^Plug $TEMP/vimrc | awk -F\' '{print $2}'); do
  PLUGIN=$(echo $x | awk -F/ '{print $2}')
  echo "Downloading $x"
  git clone -q https://github.com/$x $TEMP/plugged/$PLUGIN
  rm -rf $TEMP/plugged/$PLUGIN/.git
  if [[ -d "$TEMP/plugged/$PLUGIN/test" ]]; then
    rm -rf $TEMP/plugged/$PLUGIN/test
  fi
done

chmod 755 $TEMP
echo "# Built release at $TEMP"

