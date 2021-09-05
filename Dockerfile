FROM debian
RUN apt update
RUN apt install ssh wget npm curl -y
#RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'wget ' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:wangjimima|chpasswd
RUN chmod 755 /1.sh
EXPOSE 5678
CMD  /1.sh
