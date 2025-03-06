#!/bin/bash
set -e
set -x

# 显式指定使用 conda 环境中的 clang 和 clang++
export CC="$BUILD_PREFIX/bin/clang"
export CXX="$BUILD_PREFIX/bin/clang++"

mkdir -p build && cd build

# 配置CMake构建
cmake ${CMAKE_ARGS} -GNinja \
    -DCMAKE_PREFIX_PATH="$PREFIX" \
    -DCMAKE_INSTALL_PREFIX="$PREFIX" \
    -DSBEPP_BUILD_TESTS=OFF \
    -DSBEPP_BUILD_SBEPPC=ON \
    -DSBEPP_BUILD_EXAMPLES=OFF \
    -DSBEPP_BUILD_BENCHMARKS=OFF \
    "$SRC_DIR"

# 构建
ninja

# 安装
ninja install