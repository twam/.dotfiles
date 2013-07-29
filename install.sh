#!/bin/sh
#
# Modeled after https://github.com/holman/dotfiles/blob/master/Rakefile

GIT_VERSION_A=`git --version | sed -e 's/git version \([0-9]\+\)\.\([0-9]\+\)\.\([0-9]\+\).*/\1/'`
GIT_VERSION_B=`git --version | sed -e 's/git version \([0-9]\+\)\.\([0-9]\+\)\.\([0-9]\+\).*/\2/'`
GIT_VERSION_C=`git --version | sed -e 's/git version \([0-9]\+\)\.\([0-9]\+\)\.\([0-9]\+\).*/\3/'`

if [ "$GIT_VERSION_A" -le "1" -a $GIT_VERSION_B -le "7" -a "$GIT_VERSION_C" -lt "10" ]; then
    echo "Warning: You need at least git version 1.7.10 to support include.path!"
fi

symlinks=$(find . -name "*.symlink")

overwrite_all=false
backup_all=false

for file in $symlinks; do
    overwrite=false
    backup=false

    basename=$(basename $file .symlink)
    target="$HOME/$basename"

    if [ -e "$target" ] || [ -h "$target" ]; then
        if ! $overwrite_all && ! $backup_all; then
            while true; do
                echo "$target already exists"
                echo "[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all "
                read answer
                case $answer in
                    "s" ) continue 2;; # continue the outer for loop
                    "S" ) break 2;;    # break out of the outer for loop
                    "o" ) overwrite=true; break;;
                    "O" ) overwrite_all=true; break;;
                    "b" ) backup=true; break;;
                    "B" ) backup_all=true; break;;
                    *   ) continue ;;
                esac
            done
        fi

        if $overwrite || $overwrite_all; then
            rm $target
        fi

        if $backup || $backup_all; then
            mv $target "$HOME/$basename.backup"
        fi
    fi

    echo "Installing $target"
    ln -s "$PWD/$file" "$target"
done

