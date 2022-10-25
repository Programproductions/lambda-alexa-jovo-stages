
# TERRAFORM LAMBDAS FOR ALEXA

This Terraform template will create 3 fully configurable Lambdas in 3 stages - dev/staging and prod. (total 9 lambdas) for your Jovo alexa project. 

Each Lamba is preconfigured with an Alexa trigger - just add you skill id in the .tfvars file

Each Lambda has an Alias precofigured with an Alexa trigger that is teh same as above. so the Alias can also used as the Alexa endpoint. 

Each lamda has some pre-populated Environment variables that you can change to whatever you want. Just be sure to add sensitive info to the tfvars then add a referecne in the variables.tf file. Less sensitive variabekl can just be declered in the variables.tf file 

Each lambda is also preconfigured with DynamoDb, S3 and logging permissions.

If you dont want all three Lambas just remove the ones you dont want. The Lambdas are configured for US/UK and AU region but can easily be changed. 


After provisioning the Lambda, you will get an output in the console of the relevant lambda and Alias arns to use for the Alexa endpoints. You can take thse arns and use them in you Jovo project file stages   


# PREREQUISITES:

1. An AWS account
2. Install Terraform https://learn.hashicorp.com/tutorials/terraform/install-cli
3. An Alexa Skill ID from an Alexa skill you have after deploying a stage of your jovo app

Go to file called dev.tfvars in the root directory.

Update & save the following variables:

- access_key       = "YOUR_AWS_ACCESS_KEY_HERE"
- secret_key       = "YOUR_AWS_SECRET_KEY_HERE"
- region           = "us-east-1"
- environment      = "dev"
- alexa_skill_id   = "YOUR_PROVISIONED_ALEXA SKILL_ID"
- function_version = "$LATEST"

VERY IMORTANT - uncomment out the *tfvars and *tfvras.json in the gitignore file


# To START:

1. populate the dev.tfvars file with you credentials, your prefered region and the alexa skill ID that you want to use.

2. populate the names in the variables files.

3. make sure you cd into the root directory and use the command:

terraform init

Your terraform should initialise.

5. use the command:

terraform workspace new dev

This will create a new workspace (stage) fro you called dev

6. In the root make a folder called 'function' and a folder in that called 'dev'. Place your bundle.zip Jovo app in the 'function/dev' folder 

You can always ensure you are in the correct "workspace" with the following command 

terraform workspace select dev

7. Make a terraform plan with the following command:

terraform plan -out plan.out -var-file.dev.tfvars

this instructs terraform to use the credentials and en vars in you dev.tfvars file - nothing is provisioned yet - so check that the behaviour in the plan is expected

8. If all good use the command

terraform apply plan.out

CONGRATULATIONS YOUR DEV STAGE IS NOW PROVISIONED! 
GO HAVE A PEEK IN YOUR AWS CONSOLE :)

# NOW CREATE NEW STAGE

To create a new stage simpley follow the steps above this time when you run the terraform workspace new add a new stage - eg staging or prod. You can add you bundle.zip in the associated folders. Remember to configure the Alexa skill id relevant for your stage.

When using the plan out command simoply use the .tf var files for teh worksapce you are in eg terraform plan -out plan.out -var-file=prod.tfvars

As mentioned bfore the lambdas are in three region default being us-east-1. You na cahnge the regions by configuring the providers in the providers.tf file

NOTE you can switch between workspaces/stages any time with the workspace select command eg:

terraform workspace select dev

You can easily get rid of all resources with one command eg:

terraform destroy -var-file=dev.tfvars


# HAPPY TERRAFORMING JOVO-VIANS!!
 
Pete!

If hou have any comments, requests, think something is wrong or just want to say hi contact pete@program-productions.com 
