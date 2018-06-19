########################################
# bazel-0.12.0 ビルド # for Tensorflow r1.8
########################################
VERSION=0.12.0
mkdir -p /compile \
&& cd /compile \
&& wget --no-check-certificate https://github.com/bazelbuild/bazel/releases/download/${VERSION}/bazel-${VERSION}-dist.zip \
&& unzip bazel-${VERSION}-dist.zip -d bazel-${VERSION} \
&& cd bazel-${VERSION} \
&& ./compile.sh \
&& cp -f output/bazel /usr/local/bin/

