CD = cd packer

pk:
	@${CD} && \
		PACKER_LOG=1 && \
		packer build -var-file=variables.json example.json 

validate:
	@${CD} && \
		PACKER_LOG=1 && \
		packer validate -var-file=variables.json example.json 
	