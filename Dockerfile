FROM jpetazzo/dind
RUN apt-get install -y openssh-server nano git-core
RUN adduser --disabled-password --gecos "" git
RUN mkdir /var/run/sshd
RUN mkdir /home/git/.ssh/
ADD authorized_keys /home/git/.ssh/authorized_keys
ADD gitreceive /home/git/gitreceive
ADD receiver /home/git/receiver
ADD wrapdocker /usr/local/bin/wrapdocker
EXPOSE 22
ENTRYPOINT wrapdocker
