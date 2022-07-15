set_env () {
	if [ "$GH_ACTIONS" == true ] ; then
		echo "$1=$2" >> $GITHUB_ENV
	else
		export $1=$2
	fi
}

set_env OS_NAME $(uname -s | tr '[:upper:]' '[:lower:]')

if [ "$OS_NAME" == "linux" ] ; then
	set_env BREW_DEPS_DIR "/home/linuxbrew/.linuxbrew/Cellar"
else
	set_env BREW_DEPS_DIR "/usr/local/Cellar"
fi

set_env WEBKIT_DIR $(pwd)/deps/WebKit
set_env WEBKIT_RELEASE_TYPE release

set_env LLVM_PREFIX "$BREW_DEPS_DIR/llvm@13/13.0.1"
set_env CC "$LLVM_PREFIX/bin/clang"
set_env CXX "$LLVM_PREFIX/bin/clang++"
set_env AR "$LLVM_PREFIX/bin/llvm-ar"