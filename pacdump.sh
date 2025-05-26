#!/bin/bash

read -rp $'Create list of explicitly installed packages on this system?\n(packages YOU installed)\nY/n? ' choice

case "$choice" in
    "" | [Yy]* | [Yy][Ee][Ss]*)
        # Get current user, hostname, and date
        user_name=$(whoami)
        host_name=$(hostname)
        date_str=$(date +%F)

        # Set filename
        file_name="${user_name}_${host_name}_${date_str}.pacdump"

        # Run pacman command to get explicitly installed packages with versions
        pacman -Qe > "$file_name"

        # Strip version numbers and convert to single line
        package_list=$(cut -d' ' -f1 "$file_name" | tr '\n' ' ')

        # Overwrite file with the space-separated package names
        echo "$package_list" > "$file_name"

        echo "pacdump file generated"
        echo "pacdump file populated"
        echo "find it in your current directory \"$file_name\""
        echo 'run "sudo pacman -Syu <contents of file>" to install all packages'
        echo '(!) NOTE: if the list contains AUR packages, you will need to use an AUR helper like yay instead of pacman'
        echo 'like "yay -Syu <contents of file>"'
        ;;
    *)
        echo "OK bye"
        exit 0
        ;;
esac
