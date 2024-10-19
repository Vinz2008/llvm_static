# call this from the build dir
cmake -S ../llvm -B . -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/home/vincent/llvm_static/sysroot/usr -DCMAKE_SKIP_RPATH=ON -DLLVM_ENABLE_RTTI=ON -DLLVM_BINUTILS_INCDIR=/usr/include -DBUILD_SHARED_LIBS=false -DLIBCLANG_BUILD_STATIC=ON -DLLVM_ENABLE_BINDINGS=OFF -DLLVM_ENABLE_PROJECTS="clang;lld"
