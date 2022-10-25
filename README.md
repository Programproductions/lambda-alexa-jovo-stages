
# TERRAFORM LAMBDAS FOR ALEXA

This Terraform template will create 3 fully configurable Lambdas in 3 stages - dev/staging/prod. (total 9 lambdas) for your Jovo Alexa project. 

Each Lamba is preconfigured with an Alexa trigger - just add you skill id in the .tfvars file

Each Lambda has an Alias precofigured with an Alexa trigger that is the same as above. So the Alias can also used as the Alexa endpoint. 

Each Lamda has some pre-populated Environment variables that you can change to whatever you want. Just be sure to add sensitive info to the tfvars then add a reference in the variables.tf file. Less sensitive variables can just be declared in the variables.tf file followingthe format shown.

Each Lambda is also preconfigured with DynamoDb, S3 and Cloudwatch logging permissions. The permission scope is for "all" permissions on the resources. recommended best practice is to reduce this to only permissions needed. 

If you dont want all three Lambdas, just remove the ones you dont want from the code. The Lambdas are configured for US/UK/AU regions but can easily be changed. 

After provisioning the Lambdas, you will get an output in the console of the relevant lambda and Alias arns to use for the Alexa endpoints. You can take thse arns and use them in you Jovo project file stages   


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

**VERY IMPORTANT** - uncomment out the *tfvars and *tfvars.json in the .gitignore file - if you don't do this you will expose you credentials when using git!


# To START:

1. populate the dev.tfvars file with you credentials, your prefered region and the alexa skill ID that you want to use.

2. populate the names in the variables.tf file.

3. make sure you cd into the root directory and use the command:

**terraform init**

Your terraform should initialise.

5. use the command:

**terraform workspace new dev**

This will create a new workspace (stage) for you called 'dev'

6. In the root make a folder called 'function' and a folder in that called 'dev'. Place your bundle.zip Jovo app in the 'function/dev' folder 

You can always ensure you are in the correct "workspace" with the following command 

**terraform workspace select dev**

7. Make a terraform plan with the following command:

**terraform plan -out plan.out -var-file=dev.tfvars**

this instructs terraform to use the credentials and environemnt variables in your dev.tfvars file - nothing is provisioned yet - so check that the behaviour in the plan is expected

8. If all good use the command

**terraform apply plan.out**

CONGRATULATIONS YOUR DEV STAGE IS NOW PROVISIONED! 

GO HAVE A PEEK IN YOUR AWS CONSOLE :)

If you want to reconfigure anything from now o for example if you want to change the lock down the permissions to a particular database, juts run the terraform plan command above folowed by the terraform apply command above

# CREATE NEW STAGE

To create a new stage simply configure the another .tfvar file for the next stage - I have added examples (staging/prod) but you can name these whatever you want. Then  follow the steps above. This time when you run the terraform workspace new add a new stage - eg staging or prod.

**terraform workspace new staging**

You can add you bundle.zip in the associated folders. Remember to configure the Alexa skill id relevant for your stage.

When using the plan out command simply use the .tf var files for the workspace you are in eg 

**terraform plan -out plan.out -var-file=prod.tfvars**

As mentioned bfore the lambdas are in three regions default being us-east-1. I have included an Asia Pacific region and European region example. You can change the regions by configuring the providers in the providers.tf file

NOTE you can switch between workspaces/stages any time with the workspace select command eg:

**terraform workspace select dev**

You can easily get rid of all resources with one command eg:

**terraform destroy -var-file=dev.tfvars**


# HAPPY TERRAFORMING JOVO-VIANS!!
 
Pete!

If hou have any comments, requests, think something is wrong or just want to say hi contact pete@program-productions.com 
