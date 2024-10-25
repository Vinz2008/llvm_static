#/bin/bash
# call this from the build dir
cmake -S ../llvm -B . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$HOME/llvm_static/sysroot/usr" \
    -DCMAKE_SKIP_RPATH=ON \
    -DLLVM_ENABLE_RTTI=ON \
    -DLLVM_BINUTILS_INCDIR=/usr/include \
    -DBUILD_SHARED_LIBS=OFF \
    -DLIBCLANG_BUILD_STATIC=ON \
    -DLLVM_ENABLE_BINDINGS=OFF \
    -DLLVM_USE_LINKER=mold \
    -DLLVM_INCLUDE_BENCHMARKS=OFF \
    -DLLVM_CCACHE_BUILD=ON \
    -DLLVM_ENABLE_PROJECTS="clang;lld" \
     -G Ninja
