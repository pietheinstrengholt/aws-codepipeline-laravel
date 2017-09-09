##  Laravel 5 CodeDeploy Template

# About
An example template for deploying Laravel applications with AWS CodePipeline across an autoscaling group.
For more information see this tutorial: http://docs.aws.amazon.com/codepipeline/latest/userguide/getting-started-w.html

# deploy_laravel script
The deploy_laravel script takes care of the Laravel deployment. You might want to replace the git url with your own url. Additionally you might want to replace the sed arguments used to configure the environment script. At the moment it is not possible to make these arguments dynamic (see below).

# AWS variables
Currently it is not possible to pass AWS variables into buildspec.yml from CodePipeline. See more info:
https://stackoverflow.com/questions/41704517/aws-pass-in-variable-into-buildspec-yml-from-codepipeline
