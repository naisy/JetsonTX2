########################################
# Ubuntu 16.04 パッケージ更新
########################################
apt-get update
time apt-get dist-upgrade -y
apt-get install -y htop locate
apt autoremove -y
