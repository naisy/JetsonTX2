#!/bin/bash
# https://github.com/tensorflow/tensorflow/issues/18643
#bazel-out/host/bin/_solib_local/_U_S_Stensorflow_Scontrib_Stext_Cgen_Ugen_Uskip_Ugram_Uops_Upy_Uwrappers_Ucc___Utensorflow/libtensorflow_framework.so: undefined reference to `png_init_filter_functions_neon'

# sed
# escape characters \'$.*/[]^
# 1. Write the regex between single quotes.
# 2. \ -> \\
# 3. ' -> '\''
# 4. Put a backslash before $.*/[]^ and only those characters.


# before:
#    includes = ["."],
#    linkopts = ["-lm"],
#    visibility = ["//visibility:public"],
#    deps = ["@zlib_archive//:zlib"],
# after:
#    includes = ["."],
#    linkopts = ["-lm"],
#    copts = ["-DPNG_ARM_NEON_OPT=0"],
#    visibility = ["//visibility:public"],
#    deps = ["@zlib_archive//:zlib"],

TARGET=/compile/tensorflow/third_party/png.BUILD

OPTCHECK=`grep PNG_ARM_NEON_OPT $TARGET`

if [ -z "$OPTCHECK" ]; then
    BEFORE="linkopts = \[\"-lm\"\],$"
    AFTER="linkopts = [\"-lm\"],\n    copts = [\"-DPNG_ARM_NEON_OPT=0\"],"
    sed -i 's/'"${BEFORE}"'/'"${AFTER}"'/g' $TARGET
    echo "ok"
else
    echo "already"
fi
