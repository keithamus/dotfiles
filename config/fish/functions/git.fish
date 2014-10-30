function git

    # If I just type "git" do something useful
    if test (count $argv) = 0
        set argv st
    end

    set -l cmd $argv[1]
    set -l git (which hub)
    set -l tig (which tig)

    if [ -z $git ]
        set git (which git)
    end

    if [ -z $tig ]
        set tig $git
    end

    # If diff, show or log then remove colours, so tig can color nicely
    if contains $cmd show log blame
        eval $tig $argv
    else if contains $cmd diff
        set -l $args $argv
        set -e args[1]
        eval $git $cmd --no-color $args
    else
        eval $git $argv
    end
end
