#!/bin/bash
# Create LVM 
sudo pvcreate /dev/sdb
sudo vgcreate vg_deptdata /dev/sdb
sudo lvcreate -L 1G -n lv_dev vg_deptdata
sudo lvcreate -L 500M -n lv_hr vg_deptdata
sudo lvcreate -L 1G -n lv_it vg_deptdata
sudo lvcreate -L 1G -n lv_sales vg_deptdata
# Format with xfs
for lv in lv_dev lv_hr lv_it lv_sales; do
    sudo mkfs.xfs /dev/vg_deptdata/$lv
done
# Mount points (ensure /srv is used)
echo '/dev/vg_deptdata/lv_dev   /srv/dev     xfs  defaults        0 0
/dev/vg_deptdata/lv_hr    /srv/hr      xfs  defaults,usrquota 0 0
/dev/vg_deptdata/lv_it    /srv/it      xfs  defaults        0 0
/dev/vg_deptdata/lv_sales /srv/sales   xfs  defaults,usrquota 0 0' | sudo tee -a /etc/fstab
sudo mount -a
# Enable quotas
sudo mount -o remount /srv/hr
sudo mount -o remount /srv/sales

sudo quotacheck -cum /srv/hr
sudo quotacheck -cum /srv/sales
sudo quotaon /srv/hr
sudo quotaon /srv/sales
# Set user quotas
sudo setquota -u bob 102400 153600 0 0 /srv/hr
sudo setquota -u dave 102400 153600 0 0 /srv/sales

sudo systemctl daemon-reload

