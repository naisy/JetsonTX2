########################################
# bazel-0.10.1 ビルド # for Tensorflow r1.5 - r1.7
########################################
mkdir -p /compile \
&& cd /compile \
&& wget --no-check-certificate https://github.com/bazelbuild/bazel/releases/download/0.10.1/bazel-0.10.1-dist.zip \
&& unzip bazel-0.10.1-dist.zip -d bazel-0.10.1 \
&& cd bazel-0.10.1 \
&& ./compile.sh \
&& cp -f output/bazel /usr/local/bin/

