# Pi-Server

## Use RaspiLite 64bit
```
sudo apt update && sudo apt dist-upgrade

sudo apt install figlet git neovim

git clone https://github.com/faustouribe/pi-server.git
```
## Install Docker & Docker Compose
```
curl -sSL https://get.docker.com | sh

sudo usermod -aG docker ${USER}

sudo apt install python3-dev

sudo apt-get install libffi-dev libssl-dev

sudo apt-get install -y python3 python3-pip

sudo pip3 install docker-compose

sudo systemctl enable docker
```

## Install Tailscale
https://tailscale.com/download/linux/rpi
```
curl -fsSL https://tailscale.com/install.sh | sh
```

## Install Archey4
```
pip install archey4

sudo cp .local/bin/archey /usr/bin/archey4

sudo cp extip /usr/bin/extip
```
