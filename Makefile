setup = fedora-setup.yml
setup-dev = fedora-dev-setup.yml
hostname = BeeBox
release = 43
parameters = -e "fedora_hostname=${hostname}" -e "fedora_release=${release}"

all:
	echo "Notthing to do"

inst-deps:
	sudo dnf install ansible ansible-collection-community-general ansible-lint python3-psutil

setup:
	ansible-playbook --ask-become-pass ${parameters} ${setup} 

setup-dev:
	ansible-playbook --ask-become-pass ${setup-dev}

setup-all: 
	ansible-playbook --ask-become-pass -${parameters} ${setup} ${setup-dev}

lint:
	ansible-lint ${setup}
	ansible-lint ${setup-dev}

.PNONY: all lint setup setup-dev setup-all inst-deps
