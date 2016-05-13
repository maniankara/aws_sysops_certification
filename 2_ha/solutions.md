Auto Scaling
* Setting up EC2 autoscaling based on CPU usage
 - Create a fresh or use an existing [EC2 instanace](https://console.aws.amazon.com/ec2/)
 - Navigate to _Auto Scaling_ tab at the left corner and open the _launch configurations_ 
 - Create an _auto scaling group_, select any linux distribution for AMI, `t2.micro` for _instance type_, give a name to the _ launch configuration_ and add `touch /var/tmp/autoscaling` in the _User data_ field under _Advanced details_ section. This can be any pre-launch script. We add this here to verify that our auto-scaling instances are lauched from this launch configuration.
 - _Skip to review_ and ensure that the security group has ssh access and _Create launch configuration_ (Select a key pair)
 - In the _Auto scaling group_ window, give a name, select one of the _subnet_ and  and in _Advanced detail_ section reduce the grace period to *30* seconds.
 - _Configure scaling policy_, _Review_ and _Create autoscaling group_ use the defaults
 - Ensure an AWS ec2 instance is running now
 - Select the group under _Auto scaling groups_ and in the tab _Scaling policy_ add a new policy and give it a name
 - _Create an alarm_ whenever `maximum cpu utilization` is `>=` 10 `percent` for atleast `1` consecutive period of `1 minute`
 - 

Sticky sessions
* Configure sticky session with [lb](http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/elb-sticky-sessions.html)

 


