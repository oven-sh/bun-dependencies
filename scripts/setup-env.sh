set_env () {
	if [ "$GH_ACTIONS" == true ] ; then
		echo "$1=$2" >> $GITHUB_ENV
	else
		export $1=$2
	fi
}

main () {
	set_env OS_NAME $(uname -s | tr '[:upper:]' '[:lower:]')

	local BREW_DEPS_DIR_0=
	
	if [ "$OS_NAME" == "linux" ] ; then
		BREW_DEPS_DIR_0="/home/linuxbrew/.linuxbrew/Cellar"
	else
		BREW_DEPS_DIR_0="/usr/local/Cellar"
	fi

	set_env BREW_DEPS_DIR $BREW_DEPS_DIR_0
	set_env BUN_PKG $(pwd)/pkg
	set_env BUN_PKG_INCLUDE $(pwd)/pkg/include
	set_env BUN_PKG_LIB $(pwd)/pkg/lib

	set_env WEBKIT_DIR $(pwd)/deps/WebKit
	set_env WEBKIT_RELEASE_TYPE release

	local LLVM_PREFIX_0="$BREW_DEPS_DIR_0/llvm@13/13.0.1"

	set_env LLVM_PREFIX $LLVM_PREFIX_0
	set_env CC "$LLVM_PREFIX_0/bin/clang"
	set_env CXX "$LLVM_PREFIX_0/bin/clang++"
	set_env AR "$LLVM_PREFIX_0/bin/llvm-ar"
}

main
