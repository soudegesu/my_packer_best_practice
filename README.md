# my_packer_best_practice

My best practice of project structure to provison AWS EC2 AMI with [Packer](https://www.packer.io/).

## Preconditions

This repository requires following runtime environment and modules.
* Mac OSX
* [Python](https://www.python.org/) (3.6.1 or more)
* [Packer](https://www.packer.io/) (1.1.3 or more)
* [Ansible](https://www.ansible.com/) (2.3.1.0 or more)
* [Ruby](https://www.ruby-lang.org/ja/) (2.4 or more)
    * [Bundler](https://bundler.io/)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-install-macos.html) (1.14.30 or more)
* [Virtualbox](http://www.oracle.com/technetwork/jp/server-storage/virtualbox/overview/index.html) (5.2.12 or more)
* [Vagrant](https://www.vagrantup.com/) (2.1.1 or more)

## Setting up

* Install ansible

```bash
pip install -r requirements.txt -c constraints.txt
```

## Test ansible scripts locally

* Boot vargrant instance, initialize and take vagrant snapshot for rollback.

```bash
make init-vagrant
```

* Provison to vagrant instance with null provisioner, and rollback to initial instance state.
    * `ROLE` : role name linked ansible-playbook file.
```bash
make test-local ROLE=hoge
```

## Create AMI

* Edit your aws credential information on `~/.aws/credentials`.

```bash
[your-profile]
aws_access_key_id = [your access_key_id]
aws_secret_access_key = [your_secret_access_key]
region = [your region]
```

* Edit `packer/env-aws-variables.json` that includes packer setting for AWS provisioning.

```json
{
    "aws_region": "your-region",
    "aws_vpc_id": "vpc-xxxxxxxxxxxxxx",
    "aws_subnet_id": "subnet-xxxxxxxxxxx",
    "ssh_user": "centos",
    "use_profile": "your-profile",
    "aws_instance_role": "your-packer-role",
    "aws_keypair_name": "your-keypair-name"
}
```

* Provision AWS instacne

```bash
make create-ami ROLE=hoge AWS_KEY_FILE=${absolute path to aws key file for ssh to instance}
```
