########################################
# Tensorflow Build/Install
########################################
PYTHON_VERSION=3.6
CUDA_VERSION=8.0
TF_VERSION=1.10
CUDA_COMPUTE_CAPABILITIES=6.2 # Xavier:7.2, TX2:6.2, TX1:5.3
TF_NEED_TENSORRT=0 # if TF_VERSION < 1.8, use 0

PYV=`echo $PYTHON_VERSION | sed -e 's/\.//g'`
AMD64=x86_64  # PC
ARM64=aarch64 # Jetson
ARCH=$ARM64
SOURCE_PATH=/compile
PACKAGE_PATH=/package
SCRIPT_DIR=$(cd $(dirname $0); pwd)
#cat /usr/local/cuda/version.txt
#nvcc --version
#grep "#define CUDNN_MAJOR" -A2 /usr/include/cudnn.h
#find ./ -type f | xargs grep -nH -A 5 -B 5 TensorRT 

mkdir -p $SOURCE_PATH \
&& cd $SOURCE_PATH \
&& git clone -b r${TF_VERSION} https://github.com/tensorflow/tensorflow \
&& $SCRIPT_DIR/patch_tf1.6_png.sh \
&& $SCRIPT_DIR/patch_tf1.6_macros.sh \
&& cd $SOURCE_PATH/tensorflow \
&& grep -rl . -e '-mfpu=neon' | xargs sed -i 's/-mfpu=neon//g' \
&& env CI_BUILD_PYTHON=python$PYTHON_VERSION \
    LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:${LD_LIBRARY_PATH} \
    CUDA_TOOLKIT_PATH=/usr/local/cuda \
    CUDNN_INSTALL_PATH=/usr/lib/$ARCH-linux-gnu \
    TENSORRT_INSTALL_PATH=/usr/lib/python$PYTHON_VERSION/dist-packages \
    GCC_HOST_COMPILER_PATH=/usr/bin/gcc \
    PYTHON_BIN_PATH=/usr/bin/python$PYTHON_VERSION \
    PYTHON_LIB_PATH=/usr/local/lib/python$PYTHON_VERSION/dist-packages \
    CC_OPT_FLAGS='-march=native' \
    TF_NEED_JEMALLOC=1 \
    TF_NEED_GCP=0 \
    TF_NEED_HDFS=0 \
    TF_NEED_S3=0 \
    TF_ENABLE_XLA=0 \
    TF_NEED_GDR=0 \
    TF_NEED_VERBS=0 \
    TF_NEED_OPENCL=0 \
    TF_NEED_OPENCL_SYCL=0 \
    TF_SET_ANDROID_WORKSPACE=0 \
    TF_NEED_CUDA=1 \
    TF_CUDA_CLANG=0 \
    TF_CUDA_COMPUTE_CAPABILITIES=$CUDA_COMPUTE_CAPABILITIES \
    TF_CUDA_VERSION=$CUDA_VERSION \
    TF_CUDNN_VERSION=`grep "#define CUDNN_MAJOR" -A2 /usr/include/cudnn.h | sed -e 's/\#define\s[A-Z_]*\s*\(.*\)$/\1/g' | sed -e ':loop; N; $!b loop; s/\n/./g'` \
    TF_NEED_MPI=0 \
    TF_NEED_KAFKA=0 \
    TF_NEED_TENSORRT=$TF_NEED_TENSORRT \
    TF_NCCL_VERSION=1 \
    TF_NEED_AWS=0 \
    ./configure \
&& TF_GIT_VERSION=`cat $SOURCE_PATH/tensorflow/tensorflow/tools/pip_package/setup.py | grep "^_VERSION" | awk 'BEGIN {FS="'\''";} {printf "%s", $2}' | sed -e 's/-//g'` \
&& sed -i 's/PyArray_FromAny(ndarray, nullptr, 0, 0, NPY_ARRAY_CARRAY, nullptr)));/PyArray_FromAny(ndarray, nullptr, 0, 0, NPY_ARRAY_CARRAY_RO, nullptr)));/g' tensorflow/python/lib/core/ndarray_tensor.cc \
&& bazel build --jobs 4 --local_resources 4096,1.0,1.0 --config=cuda --config="opt" --copt='-march=native' --copt="-O3" --verbose_failures --subcommands //tensorflow/tools/pip_package:build_pip_package \
&& bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg \
&& mkdir -p $PACKAGE_PATH \
&& mv -f /tmp/tensorflow_pkg/tensorflow-$TF_GIT_VERSION-cp$PYV-cp${PYV}m*-linux_$ARCH.whl $PACKAGE_PATH/ \
&& pip install $PACKAGE_PATH/tensorflow-$TF_GIT_VERSION-cp$PYV-cp${PYV}m*-linux_$ARCH.whl
