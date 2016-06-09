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
 
RDS read replicas
* Using read replicas in RDS (mysql)
 - Setting up
   - Create a fresh t2.micro instanace or use an existing one (name it as rds-client)
    - Install mysql-client to that instance
    - Launch a fresh mysql RDS instance or use an existing one
    - Modify the security group to allow access to the ip/subnet of the rds-client
    - After the RDS instance is available, try to telnet from the rds-client with the endpoint taken from the RDS console
 - Create and test database and test data on master node
    - Try to login from rds-client with mysql client
    - e.g. login `user$ mysql -h XYZ.cwokmcu0yul8.eu-west-1.rds.amazonaws.com -u <user> -p<password>`
    - create table and insert a row
    - e.g. use the given database `mysql>use database <db name given at the time of RDS creation>` 
    - e.g. create test table `mysql>create table test (name varchar(255), city varchar(255));`
    - e.g. Insert one row to test `mysql>insert into test values('abc', 'Helsinki');`
    - Test if the row was inserted
    - e.g. Select all rows `mysql>select * from test;`
 - Create a read replica
    - From the running RDS instance, try to create a read replica in an another region 
    - Note that, after the read replica is been created, you should switch your region to see the read replica
    - Again modify the security groups to allow your ip/subnet, as this is for testing, you could choose to allow "anywhere"
    - Now open another shell session to rds-client and connect to the read replica (try telnet to see connection works)
    - Access the tables created on master node (same credentials)
    - e.g. login `user$ mysql -h XYZ-rr2.c9gnnbpfclcl.us-east-1.rds.amazonaws.com -u <user> -p<password>`
    - Test if the row was inserted
    - e.g. Select all rows `mysql>use database <db>; select * from test;`
 - Test the read replica
    - Now insert another row to the master node and verify that its replicated immediately to the read replica
    - Note that, this is the reason why we need to have two shell sessions opened to each of the RDS nodes
    - e.g. Insert second row to the master node `mysql>insert into test values('xyz', 'Espoo');`
    - e.g. Verify in the slave node (another terminal) `mysql>select * from test;`
    - Also try to insert to read replica to expect an error
    - e.g. Try to insert third row to the read replica node `mysql>insert into test values('mno', 'Tampere');`
    - Error info `ERROR 1290 (HY000): The MySQL server is running with the --read-only option so it cannot execute this statement`
 - Ensure you shutdown all the RDS instance to avoid surprise billings
    - After changing the region, in the RDS console, select the read replica which you created and press _delete_ 
    - From the master node details you should be able to see its read replica's details
    - After the replicas are deleted, delete the master node
