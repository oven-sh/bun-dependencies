ZIGDIR="$(pwd)"
ARCH="x86_64"
TARGET="$ARCH-macos-none"
MCPU="baseline"
CACHE_BASENAME="zig+llvm+lld+clang-$TARGET-0.10.0-dev.2348+d43761808"
PREFIX="$HOME/$CACHE_BASENAME"
JOBS="-j2"

wget -nv "https://ziglang.org/deps/$CACHE_BASENAME.tar.xz"
tar xf "$CACHE_BASENAME.tar.xz"

ZIG="$PREFIX/bin/zig"
export CC="$ZIG cc -target $TARGET -mcpu=$MCPU"
export CXX="$ZIG c++ -target $TARGET -mcpu=$MCPU"

# Make the `zig version` number consistent.
# This will affect the cmake command below.
git config core.abbrev 9
git fetch --unshallow || true
git fetch --tags

mkdir build
cd build
cmake .. \
  -DCMAKE_INSTALL_PREFIX="$(pwd)/release" \
  -DCMAKE_PREFIX_PATH="$PREFIX" \
  -DCMAKE_BUILD_TYPE=Release \
  -DZIG_TARGET_TRIPLE="$TARGET" \
  -DZIG_TARGET_MCPU="$MCPU" \
  -DZIG_STATIC=ON \
  -DZIG_OMIT_STAGE2=ON

# Now cmake will use zig as the C/C++ compiler. We reset the environment variables
# so that installation and testing do not get affected by them.
unset CC
unset CXX

make $JOBS install
ls
