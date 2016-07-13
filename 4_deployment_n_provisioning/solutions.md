Solutions for Deployment and provisioning

* Opsworks default stack
  - Open https://console.aws.amazon.com/opsworks
  - Click 'Add your first stack'
  - Choose 'simple stack' and choose linux/windows and press 'create stack'
  - 'Explore the simple stack', Select the 'instances' section and start the instances
  - Soon after the instance is ready, choose the 'Apps' section and press 'deploy'
  - After the deployment is sucessfull, select the 'instances' tab again and click the value in public ip
  - The nodejs app should be up and running.
  - Clean up: In the following order: Stop the instance, delete the app, delete the instance, delete the layer, delete the stack 
   
* Opsworks photo share app using ruby
  - Open https://console.aws.amazon.com/opsworks
  - 'Add stack' and select 'Chef 12 Stack' and fillin the needed values.
  - Choose 'Add layer' and add a new layer
  - In the instance tab, '+ Add instance' and choose a minimal size of your choice.
  - In the Apps tab, '+ App' and in the 'Applications Source' section, provide this [git repository]( https://github.com/awslabs/opsworks-demo-rails-photo-share-app.git) in the 'Repository URL' 
  - After the instance is ready, 'deploy' the application from the Apps tab
  - The photoSharing app should be available in the IP provided in the instances section
  - Cleanup In the following order: Stop the instance, delete the app, delete the instance, delete the layer, delete the stack 
