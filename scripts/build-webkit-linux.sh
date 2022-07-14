# TODO(sno2): add error checks after edgy commands

if [ "$WEBKIT_DIR" == "" ] ; then
	export WEBKIT_DIR=$(pwd)/deps/WebKit
fi

if ["$CC" == ""] ; then
	export CC=$(which clang-13)
fi

if ["$CXX" == ""] ; then
	export CXX=$(which clang++-13)
fi

printf $WEBKIT_DIR, "\n"

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

if [ $? -ne 0 ] ; then
	printf "Failed to build JSC.\n"
	exit 1
fi

CFLAGS="$CFLAGS -ffat-lto-objects" && \
CXXFLAGS="$CXXFLAGS -ffat-lto-objects" && \
	cmake --build $WEBKIT_DIR --config $WEBKIT_RELEASE_TYPE -- "jsc" -j$(nproc)

if [ $? -ne 0 ] ; then
	printf "Failed to build WebKit.\n"
	exit 1
fi
