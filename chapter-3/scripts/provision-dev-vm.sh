#
# Provision a development environment under Vagrant.
#

# https://serverfault.com/questions/227190/how-do-i-ask-apt-get-to-skip-any-interactive-post-install-configuration-steps
export DEBIAN_FRONTEND=noninteractive

#
# Install Docker.
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository
#
sudo apt-get -yq update
sudo apt-get -yq install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get -yq update
sudo apt-get -yq install docker-ce=5:19.03.12~3-0~ubuntu-xenial
docker --version

#
# User setup for docker.
#
sudo groupadd docker
sudo usermod -aG docker $USER
sudo service docker restart