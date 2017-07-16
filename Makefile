CD = cd packer

packer-docker:
	@${CD} && \
		PACKER_LOG=1 && \
		packer build -var-file=docker-variables.json docker-example.json 

validate:
	@${CD} && \
		PACKER_LOG=1 && \
		packer validate -var-file=docker-variables.json docker-example.json 

vagrant-init:
	vagrant halt && vagrant destroy -f && vagrant up --provision

packer-vagrant:
	@${CD} && \
		vagrant sandbox on && \
		PACKER_LOG=1 && \
		packer build -var-file=variables-vagrant.json example-vagrant.json && \
		vagrant sandbox rollback