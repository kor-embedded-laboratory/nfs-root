#!/bin/bash
sudo apt install nfs-kernel-server

printf "# /etc/exports: the access control list for filesystems which may be exported\n" > exports
printf "#       to NFS clients.  See exports(5).\n" >> exports
printf "#\n" >> exports
printf "# Example for NFSv2 and NFSv3:\n" >> exports
printf "# /srv/homes       hostname1(rw,sync,no_subtree_check) hostname2(ro,sync,no_subtree_check)\n" >> exports
printf "#\n" >> exports
printf "# Example for NFSv4:\n" >> exports
printf "# /srv/nfs4        gss/krb5i(rw,sync,fsid=0,crossmnt,no_subtree_check)\n" >> exports
printf "# /srv/nfs4/homes  gss/krb5i(rw,sync,no_subtree_check)\n" >> exports
printf "#\n\n" >> exports

printf "/home/$(whoami)/EmbeddedPackage/nfs-root/rpi3b_root_fs *(rw,sync,no_root_squash,no_subtree_check)\n" >> exports
printf "\n" >> exports

sudo cp exports /etc/exports
sudo rm exports
sudo service nfs-kernel-server restart
