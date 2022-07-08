deps=("tinycc" "lolhtml" "minimalloc" "picohttp" "zlib" "boringssl" "usockets" "uws" "base64")

Green='\033[0;32m'
Yellow='\033[0;33m'
Reset='\033[0m'

for dependency in "${deps[@]}"
do
    printf "${Yellow}$dependency - in progress${Reset}\n"
    make $dependency
    printf "${Green}$dependency - done${Reset}\n"
done