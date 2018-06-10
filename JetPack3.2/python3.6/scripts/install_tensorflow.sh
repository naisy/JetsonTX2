########################################
# TensorFlow
########################################
VERSION=$1
if [ -z "${VERSION}" ]; then
    VERSION=1.6.1
fi
pip3 install --upgrade ../binary/tensorflow-${VERSION}-cp36-cp36m-linux_aarch64.whl

python -c 'import tensorflow as tf; print(tf.__version__)'

updatedb
