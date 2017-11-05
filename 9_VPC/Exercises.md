####Instances
1. Create a fresh vpc and create a public and
private subnet into it
2. Create each instance into each of subnets and
test internet connection with apt/yum update in both
3. Install apache2/httpd on the public server and 
check if that works on browser

####NAT for instances
1. Route public traffic through NAT instance/gateway

####ACLs
1. Create a new ACL and attach to public subnet and
verify if things work (remember: Ephemeral ports)
2. Block your own IP and test



