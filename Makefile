PACKER = cd packer
ROLE = $1
AWS_KEY_FILE = $2

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

create-ami:
	@${PACKER} && \
		packer build \
		-var-file=env-aws-variables.json \
		-var-file=role-${ROLE}-variables.json \
		-var 'aws_key_file=${AWS_KEY_FILE}' \
		-var 'provision_target=${ROLE}' \
		ami-aws-template.json
