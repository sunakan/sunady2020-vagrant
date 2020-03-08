export ATAGO_IP=192.168.33.11
export ISE_IP=192.168.33.12
export UMIKAZE_IP=192.168.33.13

.PHONY: up
up:
	vagrant up

.PHONY: atago
atago:
	ssh \
		-i .vagrant/machines/atago/virtualbox/private_key \
		vagrant@${ATAGO_IP}

# デバッグ用（基本使わない？）
.PHONY: sync
sync:
	rsync -rtzv \
	-e 'ssh -i .vagrant/machines/atago/virtualbox/private_key' \
	--exclude '*.adoc' \
	--exclude 'docs' \
	--exclude '.*' \
	--exclude 'Vagrantfile' \
	--exclude 'Makefile' \
		./ \
		vagrant@${ATAGO_IP}:/home/vagrant/
