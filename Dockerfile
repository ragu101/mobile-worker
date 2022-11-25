FROM androidsdk/android-31
RUN apt-get update \  
    && apt-get install openssh-server -y \
    && service ssh start
RUN mkdir -p /root/.ssh \
    && chmod 0700 /root/.ssh \
    && passwd -u root
