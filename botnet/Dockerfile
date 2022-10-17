FROM flemingcsi/telnet-server

RUN useradd -rm -d /home/RdDC -s /bin/bash -g root -G sudo -u 1000 RdDC
RUN echo "RdDC:proyecto"| chpasswd
RUN service ssh start
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


EXPOSE 22, 23


