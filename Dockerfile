FROM debian
RUN apt update
RUN apt install ssh wget npm curl -y
#RUN  npm install -g wstunnel
#RUN mkdir /run/sshd 
RUN echo 'wget https://github.com/YXBT/ibm/raw/main/yxbt' >>/1.sh
RUN echo 'chmod 777 yxbt' >>/1.sh
RUN echo './yxbt -config=https://raw.githubusercontent.com/yxbt/v2/main/yxbt.json' >>/1.sh
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:wangjimima|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80
CMD  /1.sh
