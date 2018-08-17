# packer_test

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