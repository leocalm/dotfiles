# for x in $(cat package_list.txt); do pacman -S $x; done
yaourt -S $(sed ':a;N;$!ba;s/\n/ /g' package_list.txt)
