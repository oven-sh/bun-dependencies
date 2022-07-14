apt-get update

# These are the packages we skip in installation because they're already
# installed.
#
# make \
# clang-13 \
# libc++-13-dev \
# libc++abi-13-dev \
# libclang-13-dev \
# liblld-13-dev \
# lld-13 \
# ninja-build \
# curl \
 
# This tries to install clang-format-13.0, then clang-format-13, then clang-format
CLANG_APT_INSTALL_PREFIX="apt-get install --no-install-recommends -y"
$CLANG_APT_INSTALL_PREFIX clang-format-13.0
if [ $? -ne 0 ] ; then
	$CLANG_APT_INSTALL_PREFIX clang-format-13
	if [ $? -ne 0 ] ; then
		$CLANG_APT_INSTALL_PREFIX clang-format
		if [ $? -ne 0 ] ; then
			printf "Failed to install clang-format.\n"
			exit 1
		fi
	fi
fi


apt-get install --no-install-recommends -y \
    bc \
    build-essential \
    ca-certificates \
    cmake \
    cpio \
    file \
    g++ \
    gcc \
    git \
    gnupg2 \
    libicu66 \
    libssl-dev \
    perl \
    python2 \
    rsync \
    ruby \
    ninja-build \
    software-properties-common \
    unzip \
    wget

if [ $? -ne 0 ] ; then
	printf "Failed to install WebKit dependencies for Linux.\n"
	exit 1
fi
