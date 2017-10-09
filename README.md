#  Laravel 5 CodePipeline & CodeDeploy Template
> Piethein Strengholt (2017)

## About
An example template for deploying Laravel applications with AWS CodePipeline across an autoscaling group.
For more information see this tutorial: http://docs.aws.amazon.com/codepipeline/latest/userguide/getting-started-w.html

## deploy_laravel script
The deploy_laravel script takes care of the Laravel deployment. You might want to replace the git url with your own url. Additionally you might want to replace the sed arguments used to configure the environment script. At the moment it is not possible to make these arguments dynamic (see below).

## AWS variables
Currently it is not possible to pass AWS variables into buildspec.yml from CodePipeline. See more info:
https://stackoverflow.com/questions/41704517/aws-pass-in-variable-into-buildspec-yml-from-codepipeline

## Deploy key
If you want to clone a private repository and want to use a deploy key you can consider doing the following. Type the following command:

```
ssh-keygen -t rsa -C "your_email@youremail.com"
```

This will generate a public and a private key. It is best to not type a password, since we don't want to interrupt the deployment process. Add the public key to your GitHub Deploy keys section under settings. The private key should be packaged and added to the appspec.yml file and used during the deployment. See more information here:
http://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-files.html

Next step is the following commands. This will start the ssh-agent, trust github and import the private key for your project. You might want to change the location of the rsa file and need to type in your github repository location.

```
eval `ssh-agent -s`
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
ssh-agent bash -c 'ssh-add /root/id_rsa_file; git clone https://github.com:user/project.git'
```

When using the steps above, the deployment will automatically run.
