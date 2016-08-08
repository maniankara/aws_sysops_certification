###EBS###
* The base IOPS is always 100 when chosen less than 33.33GB
* Its impossible to extend an existing EBS volume, it can only be extended after snapshot+restoring the snapshot from a larger volume.
* Its impossible to attach a volume created on one AZ to another
* Use `dd if=/dev/xvdf of=/dev/null bs=1M` to prewarm a freshly restored ebs from snapshot. EBS pre-warm for newly created EBS volume is not needed.
* 
