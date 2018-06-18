#!/bin/bash
########################################
# pip install
########################################
apt-get install -y libjpeg-dev libxslt-dev libxml2-dev libffi-dev libcurl4-openssl-dev libssl-dev libblas-dev liblapack-dev gfortran libpng12-dev libfreetype6-dev

apt-get install -y curl
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm -rf get-pip.py

pip install --upgrade pip
pip install --upgrade setuptools
pip install --upgrade numpy
#pip install --upgrade scipy
#pip install --upgrade pandas
pip install --upgrade matplotlib
#pip install --upgrade seaborn
#pip install --upgrade requests
pip install --upgrade futures
pip install --upgrade Pillow
#pip install --upgrade sklearn
#pip install --upgrade tqdm
pip install --upgrade cython
pip install --upgrade scikit-image
#pip install --upgrade smbus2
#pip install --upgrade spidev
pip install --upgrade absl-py
#pip install --upgrade sympy
pip install --upgrade pyyaml
#pip install --upgrade keras
#pip install --upgrade h5py

#pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U
