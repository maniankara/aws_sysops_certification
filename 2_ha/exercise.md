Auto Scaling
* Setting up EC2 autoscaling based on CPU usage
 - Create an _Auto Scaling_ setup so that there is one instance running there all the time and a newer instance gets automatically scaled-up whenever `maximum cpu utilization` is `>=` 10 `percent` for atleast `1` consecutive period of `1 minute`
 - Solutions in `solutions.txt`
 
Sticky sessions
* Configure sticky session with [lb](http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/elb-sticky-sessions.html)
 - Create two ec2 micro instances and install nginx to those (ubuntu: apt-get install -y nginx)
 - Modify the default index.html for each host (replace heading to 'Welcome to nginx1/nginx2!') which is usually located at: /usr/share/nginx/html/index.html to identify themselves
 - Create a new lb and add the above instances to that.
 - Verify if the load balancing happens by hard refreshing the lb's url (sometime private window browsing is needed)

   (a) Test application based sticky session
   - Now, [enable sticky session](http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/elb-sticky-sessions.html) based on time (say 20 seconds) and try again to refresh the lb url.
    - You should note that, the switching of the hosts happens only after sticky timeout (20 seconds in this case)
   (b) Test duration based sticky session
   - Now, [enable sticky session](http://docs.aws.amazon.com/ElasticLoadBalancing/latest/DeveloperGuide/elb-sticky-sessions.html) based on duration (say 20 seconds) and try again to refresh the lb url.
    - You should note that, the switching of the hosts happens only after sticky timeout (20 seconds in this case)
 
