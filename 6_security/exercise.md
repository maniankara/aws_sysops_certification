S3 home folder for a user
* Create a fresh bucket and create home/test folder under that.
* Create a new non-administrator user with IAM 
* Try to access the bucket or home folder, the access should be denied.
* Now try to add permissions to IAM so that the new user is able to:
 * Browse to the home/test folder
 * Able to place files into home/test/ folder
 * Unable to place files into folders above test/ (e.g. to home/ folder or anywhere else)
