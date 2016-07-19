Pilot light architecture with [simple javascript app](https://github.com/airpair/T0021-airpair-angularjs-tutorial)
* Create an ec2 instance and in the 'Configure instance details->Advanced details' section, add the following scriptlet
```
#!/bin/bash
sudo apt-get install -y git apache2;
cd /var/www/html;
sudo git clone https://github.com/airpair/T0021-airpair-angularjs-tutorial.git demo
```
* Ensure that, the security group which you choose allows connections to that instance on port 80.
* After the instance is up, http://<PublicIP>/demo should take you to the simple js app
