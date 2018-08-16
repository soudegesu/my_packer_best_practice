# packer_test

My best practice of project structure to provison AWS EC2 AMI with [Packer](https://www.packer.io/).

## Preconditions

This repository requires following runtime environment and modules.
* Mac OSX
* [Packer](https://www.packer.io/) (1.1.3 or more)
* [Ansible](https://www.ansible.com/) (2.3.1.0 or more)
* [Ruby](https://www.ruby-lang.org/ja/) (2.4 or more)
    * [Bundler](https://bundler.io/)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-install-macos.html) (1.14.30 or more)
* [Virtualbox](http://www.oracle.com/technetwork/jp/server-storage/virtualbox/overview/index.html) (5.2.12 or more)
* [Vagrant](https://www.vagrantup.com/) (2.1.1 or more)

## Execution

### 1. Use Docker case
* generate ssh key.

```
ssh-keygen -t rsa -b 4096
```

and then, we named key `./id_rsa` .
After that, `mv ./id_rsa.pub authorized_keys` .

* execute docker-compose

```
docker-compose up --build
```

* try to enable ssh with ec2-user

```
ssh ec2-user@127.0.0.1 -i ./id_rsa
> [ec2-user@xxxxxxxxx ~]
```

* execute packer

```
make packer-docker
```

### 2. Use Vagrant Case

* initialize vagrant

```
make vagrant-init
```

* execute privisioning with packer

```
make packer-vagrant
```