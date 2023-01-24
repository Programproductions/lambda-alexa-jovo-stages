# CREATE A terraform.tfvars FILE WITH YOUR CREDENTIALS
variable "access_key" {}
variable "secret_key" {}
variable "region" {}
variable "environment" {}
variable "alexa_skill_id" {}
variable "function_version" {}
variable "api_key" {}
variable "opensea_api_key" {}
variable "gameon_api_key" {}


# MODIFY VARIABLES BELOW
variable "application" {
  type        = string
  description = "Application Name"
  default     = "Trading-Tycoon-2023"
}


variable "function_name" {
  type        = string
  description = "lambda Function Name"
  default     = "Trading-Tycoon-2023"
}

variable "lambda_role_name" {
  type        = string
  description = "lambda Function role Name"
  default     = "Trading-Tycoon-2023"
}

variable "alias_name" {
  type        = string
  description = "lambda Function role Name"
  default     = "alexa-endpoint"
}

