# packer_test

## Abstract
This repo is example for Packer execution to amazonlinux container. 

## Preconditions
* this repo needs
    * docker (17.06 or more)
    * docker-compose (1.14 or more)
    * packer (1.0.2 or more)
    * ansible (2.3.1.0 or more)

## Execution

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