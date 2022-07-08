for dir in /home/linuxbrew/.linuxbrew/Cellar/*/ ; do
    dir=${dir%*/}
    dir="${dir##*/}"
    
    brew link $dir
done