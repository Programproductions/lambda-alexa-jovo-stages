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

variable "memory_size" {
  type        = string
  description = "memory size - can be increased"
  default     = "1024"
}

variable "timeout" {
  type        = string
  description = "7 sec time out max for alexa skill"
  default     = "7"
}
# MODIFY VARIABLES BELOW
variable "application" {
  type        = string
  description = "Application Name"
  default     = "YOUR APP NAME"
}


variable "function_name" {
  type        = string
  description = "lambda Function Name"
  default     = "YOIUR FUNCTION NAME"
}

variable "lambda_role_name" {
  type        = string
  description = "lambda Function role Name"
  default     = "YOUR ROLE NAME"
}

variable "alias_name" {
  type        = string
  description = "lambda Function role Name"
  default     = "alexa-endpoint"
}

