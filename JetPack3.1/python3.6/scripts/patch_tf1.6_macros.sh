#!/bin/bash
#https://github.com/tensorflow/tensorflow/issues/19203
#./tensorflow/core/kernels/gather_functor_gpu.cu.h(57): error: calling a __host__ function("__builtin_expect") from a __global__ function("tensorflow::GatherOpKernel< ::Eigen::half, int, (bool)1> ") is not allowed

# sed
# input escape characters \'$.*/[]^
# 1. Write the regex between single quotes.
# 2. \ -> \\
# 3. ' -> '\''
# 4. Put a backslash before $.*/[]^ and only those characters.
# output escape characters &|
# 1. Put a backslash before &| and only those characters.



# before:
##if TF_HAS_BUILTIN(__builtin_expect) || (defined(__GNUC__) && __GNUC__ >= 3)
# after:
##if (!defined(__NVCC__)) && (TF_HAS_BUILTIN(__builtin_expect) || (defined(__GNUC__) && __GNUC__ >= 3))

TARGET=/compile/tensorflow/tensorflow/core/platform/macros.h

BEFORE="#if TF_HAS_BUILTIN(__builtin_expect) || (defined(__GNUC__) && __GNUC__ >= 3)"
AFTER="#if (!defined(__NVCC__)) \&\& (TF_HAS_BUILTIN(__builtin_expect) \|\| (defined(__GNUC__) \&\& __GNUC__ >= 3))"
sed -i 's/^'"${BEFORE}"'$/'"${AFTER}"'/g' $TARGET
