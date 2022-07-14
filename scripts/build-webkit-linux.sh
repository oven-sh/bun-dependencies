# TODO(sno2): add error checks after edgy commands

cd $WEBKIT_DIR

cmake \
	-DPORT="JSCOnly" \
	-DENABLE_STATIC_JSC=ON \
	-DCMAKE_BUILD_TYPE=$WEBKIT_RELEASE_TYPE \
	-DUSE_THIN_ARCHIVES=OFF \
	-DENABLE_FTL_JIT=ON \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	-G Ninja \
	-DCMAKE_CXX_COMPILER=$CXX \
	-DCMAKE_C_COMPILER=$CC \
	$WEBKIT_DIR

CFLAGS="$CFLAGS -ffat-lto-objects"
CXXFLAGS="$CXXFLAGS -ffat-lto-objects"

cmake --build . --config $WEBKIT_RELEASE_TYPE -- "jsc" -j$(nproc) .
