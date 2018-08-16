PACKER = cd packer
ROLE = $1

init-vagrant:
	vagrant halt && vagrant destroy -f && vagrant up --provision && \
		vagrant snapshot save initial-save

test-local:
	@${PACKER} && \
		vagrant snapshot restore initial-save && \
		packer build -var-file=env-local-variables.json \
		-var 'ssh_key=$(CURDIR)/.vagrant/machines/default/virtualbox/private_key' \
		-var 'provision_target=${ROLE}' \
		ami-local-template.json
