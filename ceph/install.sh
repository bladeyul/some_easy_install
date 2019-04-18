#拉取镜像 
docker pull ceph/daemon:latest-mimic

#这个需要根据服务器具体地址修改
mon_ip=192.168.56.101   #mon的地址
subnet=192.168.56.0/24  #网段
device=/dev/sdb         #挂载的osd硬盘
#

mkdir /etc/ceph
mkdir /var/lib/ceph

#启动mon服务
docker run -d --net=host v /etc/ceph:/etc/ceph -v /var/lib/ceph:/var/lib/ceph -e MON_IP= $mon_ip -e CEPH_PUBLIC_NETWORK= $subnet ceph/daemon mon

#启动manager服务
docker run -d --net=host -v /etc/ceph:/etc/ceph -v /var/lib/ceph:/var/lib/ceph ceph/daemon mgr

#启动OSD服务
docker run -d --net=host -v /etc/ceph:/etc/ceph -v/var/lib/ceph:/var/lib/ceph -v /dev/:/dev/ --pid=host --privileged=true -e OSD_DEVICE=$device -e OSD_TYPE=disk -v /run/udev:/run/udev/ ceph/daemon osd
