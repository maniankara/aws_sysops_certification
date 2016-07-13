Solutions for Deployment and provisioning

* Opsworks default stack
  - Open https://console.aws.amazon.com/opsworks
  - Click 'Add your first stack'
  - Choose 'simple stack' and choose linux/windows and press 'create stack'
  - 'Explore the simple stack', Select the 'instances' section and start the instances
  - Soon after the instance is ready, choose the 'Apps' section and press 'deploy'
  - After the deployment is sucessfull, select the 'instances' tab again and click the value in public ip
  - The nodejs app should be up and running.
  - Clean up: In the following order: Stop the instance, delete the instance, delete the layer, delete the stack 
   
* Opsworks photo share app using ruby
  - Open https://console.aws.amazon.com/opsworks
  - 'Add stack' and select 'Chef 12 Stack' and fillin the needed values.
  - Turn on 'Use custom Chef cookbooks' and provide the [git repository]( https://github.com/awslabs/opsworks-demo-rails-photo-share-app.git)
