#!/bin/bash
# 再起動が入るsetup.shを先に実行しておく
# apt-get install でエラーが出たら、/usr/bin/pythonのリンクを2.7にしてapt-get removeする
# ModuleNotFoundError: No module named 'ConfigParser'
# sudo rm /usr/bin/python
# sudo ln -s /usr/bin/python2.7 /usr/bin/python

########################################
# Ubuntu 16.04 パッケージ更新
########################################
apt-get update
time apt-get dist-upgrade -y
apt-get install -y htop locate
apt autoremove -y


########################################
# pip3 install
########################################
# pip 10.0.1への更新後は、別shellでpipを実行しないとエラーになる。そのためpip更新は先に別shellで行っておく
pip install --upgrade pip
./install_pip.sh


########################################
# Jupyter インストール
########################################
./install_jupyter.sh
# パスワード：mypassword


########################################
# Java8 インストール
########################################
#./install_java8.sh


########################################
# Build Tools インストール
########################################
#./install_build_tools.sh


########################################
# CUDA deviceQueryビルド
########################################
./install_cuda_deviceQuery.sh


########################################
# パッケージ作成/インストール準備
########################################
# 自作パッケージはTX2デフォルトのarm64で作る
dpkg --print-architecture


########################################
# OpenCV用にCUDAヘッダーパッチ適用
########################################
# OpenCV make中にエラーが発生するため、cudaヘッダを書き換えるパッチを当てる
./install_cv_patch.sh


########################################
# OpenCV 3.4.0 パッケージ作成/インストール
########################################
#./build_opencv-3.4.0.sh
./install_opencv-3.4.0.sh


########################################
# bazel-0.10.0
########################################
#./build_bazel-0.10.0.sh


########################################
# TensorFlow r1.4.1
########################################
./install_tensorflow-r1.4.1.sh

