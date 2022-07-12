if [[ "${OS_NAME}" == "" ]] ; then
    export OS_NAME=$(uname -s | tr '[:upper:]' '[:lower:]')
fi

cd ./deps/zig

# Tell the LLVM path and force static LLVM for bugs on macOS.
cmake . -DCMAKE_PREFIX_PATH=$(brew --prefix llvm) -DZIG_STATIC_LLVM=on -DCMAKE_BUILD_TYPE=Release

if [[ $? -ne 0 ]] ; then
    printf "CMake exited with error code ${$?}. There are most likely more errors above.\n"
    exit 1
fi

cd ../../
