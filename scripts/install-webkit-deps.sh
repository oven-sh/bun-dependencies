apt-get update

# These are the packages we skip in installation because they're already
# installed.
#
# clang-13 \
# libc++-13-dev \
# libc++abi-13-dev \
# libclang-13-dev \
# liblld-13-dev \
# lld-13 \

apt-get install --no-install-recommends -y \
    bc \
    build-essential \
    ca-certificates \
    clang-format-13 \
    cmake \
    cpio \
    curl \
    file \
    g++ \
    gcc \
    git \
    gnupg2 \
    libicu66 \
    libssl-dev \
    make \
    ninja-build \
    perl \
    python2 \
    rsync \
    ruby \
    software-properties-common \
    unzip \
    wget

if [ $? -ne 0 ] ; then
	printf "Failed to install WebKit dependencies for Linux.\n"
	exit 1
fi
