########################################
# bazel Build
########################################
VERSION=0.15.0 # for Tensorflow r1.10
mkdir -p /compile \
&& cd /compile \
&& wget --no-check-certificate https://github.com/bazelbuild/bazel/releases/download/${VERSION}/bazel-${VERSION}-dist.zip \
&& unzip bazel-${VERSION}-dist.zip -d bazel-${VERSION} \
&& cd bazel-${VERSION} \
&& ./compile.sh \
&& cp -f output/bazel /usr/local/bin/
