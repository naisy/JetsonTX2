########################################
# Ubuntu 16.04 パッケージ更新
########################################
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F60F4B3D7FA2AF80
apt-get update
time apt-get dist-upgrade -y --allow-unauthenticated
apt-get install -y htop
apt autoremove -y
