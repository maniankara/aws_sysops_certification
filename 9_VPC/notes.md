####private and public subnets
0. All subnets are by default in private network
1. To make a subnet public:
 - Add an internet gateway to subnet
 - Mark the subnet to assign public IPs
2. To NAT a private subnet:
 -  Create a NAT gateway in public subnet and 
 add it to the private subnet's route OR
 - Create a NAT instance in public subnet ....
 
####Load balancers
1. Load balancer can be in different 
availability zones (subnets) though the instance
to which it routes traffic is only on 1.
2. If you try to select a private subnet for an
internet facing load balancer, then it issues a warning

####Security groups
1. In order for any instance to communicate with other 
on different subnet, they should share same security group
or have ones security group as inbounds in other.
