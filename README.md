# Jetson TX2 settings

## ssh login to TX2  
> ssh ubuntu@192.168.x.x  

## 1. Setup before install
If you need SPI, please remove comment out from setup.sh.

> sudo su  
> cd ${JETPACK_VERSION}/${PYTHON_VERSION}/scripts  
> ./setup.sh  

wait reboot and re-login to TX2

## 2. Install
If you need to build from source, please remove comment out from install.sh

> sudo su  
> cd ${JETPACK_VERSION}/${PYTHON_VERSION}/scripts  
> ./install.sh  

