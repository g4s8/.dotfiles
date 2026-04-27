#!/bin/bash

set -euo pipefail
cd ${0%/*}

rm -fr .bashrc.d
cp -vr $HOME/.bashrc.d -t $PWD
