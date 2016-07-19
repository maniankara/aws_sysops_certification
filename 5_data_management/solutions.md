Pilot light architecture 
* Create an ec2 instance and in the 'Configure instance details->Advanced details' section, add the following scriptlet
```
#!/bin/bash
sudo apt-get install -y git apache2;
cd /var/www/html;
sudo git clone https://github.com/airpair/T0021-airpair-angularjs-tutorial.git demo
```
