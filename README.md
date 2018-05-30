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
> git checkout JetPack3.1_python2.7  

## 4. Setting before install
> cd JetPack3.1/python2.7/scripts  
> find ./ -type f | xargs -n1 sed -i "s/\r//g"  
> chmod 755 *.sh  
>  
> sudo su  
> ./setup.sh  

## 5. Install
> sudo su  
> ./install.sh  
