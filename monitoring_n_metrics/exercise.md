* APP: Create a bean stalk (rails) application and deploy it
* LOAD: Create a load generator bean stalk application: https://github.com/awslabs/eb-locustio-sample
* Create a cloud watch alarm to autoscale if the APP's EnvironmentHealth >= 5 for 5 minutes
* Create also some dashboards

EBS monitoring
* Create a fresh/use an existing EC2 and enable EBS monitoring
  - Ensure that you have atleast one volume in use from here: http://console.aws.amazon.com/ec2
  - Note the volumeId 
  - Open cloud watch: http://console.aws.amazon.com/cloudwatch and you are able to see _EBS Metrics_. If not, then choose a different region from the right top corner
  - Open _EBS Metrics_ and select the noted volumeId's metrics and generate graphs.
  - (Optional): Try to generate cloud watch alarms based on some behavior of the EBS metrics

Elastic Load Balancer
* Create a fresh/use an existing EC2
  - Install httpd and start the service
  - Check with WGET if the localhost and Public IP/DNS works
* Create an LB for it
  - From the Ec2's dashboard create an LB
  - Ensure the selected security group has port 80 opened for inbound connections
  - Ensure that "Status" is showing atleast 1 in the loadbalancer's selection in EC2.
    Otherwise, try to tune the Health check based on the need (e.g. change /index.html to /)
  - Check with browser the Public DNS if it works  
* (optional) Try to test this ElasticLB with eb-locustio

Cloud watch metrics
* Create custom metrics
  - Put custom metrics with 'put-metric-data' and 'get-metric-statistics'
  
Elasticache (*Your billing ends only after you [delete your cluster](http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/GettingStarted.DeleteCacheCluster.html)*)

Note: _One should go through the complex Private/public NAT setup to get the `elastic cache` working outside of your `vpc`. To keep it simple, launch an extra t2.micro for this purpose._
* Memcached
 - Launch [aws memcached cluster](https://console.aws.amazon.com/elasticache/) based on the [aws instructions](http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/GettingStarted.CreateCluster.html)
 - Ensure that, the security group has port 11211 InBound connections open (from `anywhere`, again, this is only possible with Private/Public NAT-ing)
 - Try to telnet to the [cluster node](http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/GettingStarted.ConnectToCacheNode.html) and execute those basic commands.
 - Try to connect with a client (e.g. ruby: https://github.com/petergoldstein/dalli)
 - Dont forget to [delete your cluster](http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/GettingStarted.DeleteCacheCluster.html)
* Redis
 - Launch an [redis elasticCache cluster](http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/GettingStarted.CreateCluster.html) with m3.medium (smallest available) with default security group or security group which can InBound `6379`. Rest can be with default values
 - Install [redis-cli](http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/GettingStarted.ConnectToCacheNode.html#GettingStarted.ConnectToCacheNode.Redis) and execute those basic commands.
 - Try to connect with some client (e.g. ruby https://github.com/redis/redis-rb)
 - Dont forget to [delete your cluster](http://docs.aws.amazon.com/AmazonElastiCache/latest/UserGuide/GettingStarted.DeleteCacheCluster.html), do it from the `replication groups`
 
Also, delete this t2.micro instance which was created for testing `aws elastic cache`
