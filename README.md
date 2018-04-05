# Jetson TX2 settings

Install OpenCV/Tensorflow on Jetson TX2.

## ssh login to TX2  
> ssh ubuntu@192.168.x.x  

## 1. git clone
> git clone https://github.com/naisy/JetsonTX2  
> cd JetsonTX2  

## 2. show branch
> git branch -r  

## 3. checkout branch
> git checkout JetPack3.1_python3.6  

## 4. Setting before install
> cd JetPack3.1/python3.6/scripts  
> chmod 755 *.sh  
> 
> sudo ./setup.sh  

## 5. Install
> sudo ./install.sh

