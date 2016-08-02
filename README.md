* Syllabus and preparatory materials are in the wiki: https://github.com/maniankara/aws_sysops_certification/wiki

* Some tips from a fresh examination passer :)
 * Section 1 - Monitoring, Metrics & Analysis

    - Elastic Cache Monitoring (Which parameter have to be twerked ?)
    - System Status & Instance Status Checks (What have to be done when these  issues occur)
    - Custom Metrics (Get to know what are the basic metrics and what are the  custom metrics)
    - ELB ( Sticky sessions, Connection Draining, Cross zone load balancing)
    - ICMP (Try out these scenarios 1) Launch VPC and two separate AZ's,    figure out what have to be changed in the SG's. 2)
    - Launch two VPC's and  two separate AZ's and allow rules on SG'.s

 * Section 2 - High Availability
    - Bastion Hosts - Experiment with the scenario which Ryan explains in the    video
    - Multi-AZ - what has to be done to configure the services to enable Multi-AZ
    - Elasticity - In which scenarios this has to be selected.
    - RDS - Failover scenarios

 * Section 3 - Deployment & Provisioning 
    - Root Access - Make sure you know which services require access
    - ELB -  (When actually Pre-warming is needed ?)

 * Section 4 - Data Management
    - Disaster Recovery - Know about the approaches
    - AWS Services & Automated Backups - Know about the AWS backup services.
    - EBS vs Instance Store - Know the differences
    - Log Files - Which AWS Services have feature of access logging

 * Section 5 - Opsworks
    - Know about the layers, when to use the Opsworks (Terms to look are Lifecycles, recipes)

 * Section 6 - Security
    - When to use roles and MFA, S3 Accidental Termination (MFA, Versioning), Audits (What are required for the audits)

 * Section 7 - Networking 
    - What to change during the network bottlenecks ? , When to use the different routing policies in Route 53, Know about the Security groups (What have to be allowed to have proper communication between the webserver and application in the security groups), NACL's (What can be denied in NACL's)
