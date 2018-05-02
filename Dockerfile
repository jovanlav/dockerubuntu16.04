FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server

RUN mkdir /var/run/sshd

# Set root password
RUN echo 'root:Str0ngP455w0rd' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login,
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Expose ssh port
EXPOSE 22
EXPOSE 80

# Change default ssh port.
#sed -i 's/Port 22/Port 2234/' /etc/ssh/sshd_config
COPY adduser.sh adduser.sh
CMD chmod +x adduser.sh
RUN apt-get install sudo && apt-get update
CMD mv adduser.sh /usr/local/bin/
CMD adduser.sh

CMD ["/usr/sbin/sshd", "-D"]
