# packer_test

## Abstract
This repo is example for Packer execution to amazonlinux container. 

## Preconditions
* this repo needs
    * packer (1.0.2 or more)
    * ansible (2.3.1.0 or more)
* optional install
    * you use container
        * docker (17.06 or more)
        * docker-compose (1.14 or more)
    * you use VM box
        * virtualbox (5.1.22 or more)
        * vagrant (1.9.7 or more)
        * sahara (0.0.17 or more)
            * install command `vagrant plugin install sahara`

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
make pk
```

### 2. Use Vagrant Case

* startup vagrant

```
vagrant up
```

* set vagrant sandbox

```
vagrant sandbox on
```

* rollback to initial state

```
vagrant sandbox rollback
```