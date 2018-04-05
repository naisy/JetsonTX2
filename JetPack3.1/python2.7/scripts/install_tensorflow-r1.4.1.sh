#!/bin/bash
########################################
# TensorFlow r1.4.1
########################################
mkdir -p ../binary/
cd ../binary
if [ ! -e  tensorflow-1.4.1-cp27-cp27mu-linux_aarch64.whl ]; then
    wget https://raw.githubusercontent.com/peterlee0127/tensorflow-nvJetson/master/tensorflow-1.4.1-cp27-cp27mu-linux_aarch64.whl
fi
pip install --upgrade tensorflow-1.4.1-cp27-cp27mu-linux_aarch64.whl

python -c 'import tensorflow as tf; print(tf.__version__)'
#python -c 'import cv2; print(cv2.__version__)'

updatedb
