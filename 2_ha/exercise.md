Auto Scaling
* Setting up EC2 autoscaling based on CPU usage
 - Create an _Auto Scaling_ setup so that there is one instance running there all the time and a newer instance gets automatically scaled-up whenever `maximum cpu utilization` is `>=` 10 `percent` for atleast `1` consecutive period of `1 minute`
 - Solutions in `solutions.txt`
 
Sticky sessions
* Configure sticky session with [lb](http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/elb-sticky-sessions.html)
 - Test application based sticky session
 - Test duration based sticky session
 


