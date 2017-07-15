FROM amazonlinux

# set yum repository mirror for jp
RUN yum -y install yum-plugin-fastestmirror
RUN sed -ri 's/#include_only=.nl,.de,.uk,.ie/include_only=.jp/g' /etc/yum/pluginconf.d/fastestmirror.conf

# install packages
RUN yum -y update
RUN yum -y install vim
RUN yum -y install passwd openssh openssh-server openssh-clients sudo iproute

# create users
RUN useradd ec2-user
RUN passwd -f -u ec2-user

# setup sudoers
RUN echo "ec2-user ALL=(ALL) ALL" >> /etc/sudoers.d/ec2-user

# setup SSH
RUN mkdir -p /home/ec2-user/.ssh; chown ec2-user /home/ec2-user/.ssh; chmod 700 /home/ec2-user/.ssh
ADD authorized_keys /home/ec2-user/.ssh/authorized_keys
RUN chown ec2-user /home/ec2-user/.ssh/authorized_keys
RUN chmod 600 /home/ec2-user/.ssh/authorized_keys

# setup sshd config
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

RUN /etc/init.d/sshd start

EXPOSE 22
CMD ["/sbin/init"]