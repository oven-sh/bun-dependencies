deps=("tinycc" "lolhtml" "mimalloc" "picohttp" "zlib" "boringssl" "usockets" "uws" "base64" "libarchive" "libbacktrace")

Red='\033[0;31m'
Green='\033[0;32m'
Yellow='\033[0;33m'
Reset='\033[0m'

for dependency in "${deps[@]}"
do
    printf "${Yellow}$dependency - in progress${Reset}\n"
    make $dependency

		if [[ $? -ne 0 ]] ; then
				printf "${Red}$dependency - failed${Reset}\n"
				exit 1
		fi

    printf "${Green}$dependency - done${Reset}\n"
done
