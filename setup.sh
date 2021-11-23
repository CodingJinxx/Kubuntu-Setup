#!/usr/bin/env bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"


setup()
{
    $DIR/docker_install.sh || true
    $DIR/fira_code.sh || true 
    $DIR/node_install.sh || true 
    $DIR/fish_install.sh || true
    $DIR/python_install.sh || true
}

set -e

echo "Starting install"
setup 2>&1 > /dev/null
echo "Finsihed Install"