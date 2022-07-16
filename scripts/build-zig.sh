cd ./deps

cmake ./zig

if [ $? -ne 0 ] ; then
	printf "Failed to run cmake command.\n"
	exit 1
fi

cd ..
