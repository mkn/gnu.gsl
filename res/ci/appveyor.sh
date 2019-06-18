#!/usr/bin/env bash
set -e
CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PATH="$PWD:/c/Python36-x64:/c/Program Files/Git/usr/bin:$PATH"
export MKN_CL_PREFERRED=1
curl -L https://github.com/Dekken/maiken/raw/binaries/win10_x64/mkn.exe -o mkn.exe
cd ../..
./mkn clean build run -dtKO
