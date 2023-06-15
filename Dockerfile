FROM androidsdk/android-31
RUN apt-get update \
    && apt-get install openssh-server sudo -y
RUN groupadd -g 10000 jenkins
RUN useradd -rm -d /home/jenkins -s /bin/bash -g jenkins -G jenkins -G android -u 10000 jenkins
RUN chmod 740 /home/jenkins
RUN mkdir -p /etc/sudoers.d \
    && echo "jenkins ALL=(root) NOPASSWD:SETENV: /opt/android-sdk-linux/cmdline-tools/latest/bin/sdkmanager" > /etc/sudoers.d/jenkins \
    && echo "jenkins ALL=(root) NOPASSWD:SETENV: /opt/tools/copy-ssh-key.sh" >> /etc/sudoers.d/jenkins
