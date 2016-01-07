function findup -d "Find a file, walking up the current dir to the top"
    set -l file $argv[1]
    set -l dir (pwd)
    while [ $dir != "/" ];
        if [ -e "$dir/$file" ]
            echo "$dir/$file"
            return 0
        end
        set -l dir (dirname $dir)
    end
    return 1
end
