#!/bin/bash
for i in {glance-0,nova-0,cinder-0,kubernetes-0}
do
if [ ! -n `sudo ceph osd pool ls |grep $i` ] ; then
  sudo ceph osd pool create $i
  sudo rbd pool init $i
  sudo ceph auth get-or-create client.$i mon 'profile rbd' osd 'profile rbd pool='$i''
else
  echo "'$i' pool exist, skip."
fi
done
