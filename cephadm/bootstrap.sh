#!/bin/bash
sudo apt update && sudo apt install cephadm ceph-common -y
sudo cephadm --docker --image registry.cloud.lab/ceph/ceph:v18 bootstrap \
	--apply-spec ./cluster.yaml \
	--ssh-user ubuntu \
	--ssh-private-key /home/ubuntu/.ssh/id_rsa \
	--ssh-public-key /home/ubuntu/.ssh/id_rsa.pub \
	--mon-ip 10.200.101.171 \
	--skip-monitoring-stack
