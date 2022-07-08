for dir in $BREW_DEPS_DIR/*/ ; do
    dir=${dir%*/}
    dir="${dir##*/}"
    
    brew link $dir
done
