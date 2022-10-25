# CREATE A terraform.tfvars FILE WITH YOUR CREDENTIALS
variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "environment" {}
variable "alexa_skill_id" {}
variable "function_version" {}


# MODIFY VARIABLES BELOW
variable "application" {
  type        = string
  description = "Application Name"
  default     = "YOUR_APP_NAME"
}


variable "function_name" {
  type        = string
  description = "lambda Function Name"
  default     = "YOUR_FUNCTION_NAME"
}

variable "lambda_role_name" {
  type        = string
  description = "lambda Function role Name"
  default     = "YOUR_FUNTION_ROLE"
}

variable "alias_name" {
  type        = string
  description = "lambda Function role Name"
  default     = "alexa-endpoint"
}

