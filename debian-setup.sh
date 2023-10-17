#! /bin/sh

apt_install()
{
	apt-get install -y \
		git \
		wget \
		curl
}

docker_install()
{
	# Add Docker's official GPG key:
	apt-get update
	apt-get install -y ca-certificates curl gnupg
	install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	chmod a+r /etc/apt/keyrings/docker.gpg

	# Add the repository to Apt sources:
	echo \
	  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
	  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
	  tee /etc/apt/sources.list.d/docker.list > /dev/null
	apt-get update
	apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

}

ohmybash_install()
{
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
	rm /root/.bashrc
	echo source ~/.config/bash/.bashrc > .bashrc
}

atuin_install()
{
	bash <(curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh)
    atuin import auto
}

config_install()
{
	mkdir -p /root/tmp
	cd /root/tmp
	git clone https://github.com/philingood/serve-config.git
	cp -r serve-config/.config /root/
	cd /
	rm -r /root/tmp
}

apt_install
docker_install
ohmybash_install
atuin_install
config_install