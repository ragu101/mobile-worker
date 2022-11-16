FROM androidsdk/android-30
RUN apt-get update \  
    && apt-get install openssh-server -y \
    && service ssh start
RUN mkdir -p /root/.ssh \
    && chmod 0700 /root/.ssh \
    && passwd -u root \
    && echo -e "PasswordAuthentication no" >> /etc/ssh/sshd_config \
    && sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
#test
