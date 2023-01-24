

########################################################
########### US LAMBDA FOR ALEXA BUSINESS LOGIC
#####################################################
# Creating Lambda resource
resource "aws_lambda_function" "alexa_business_logic" {
  function_name = "alexa-${var.function_name}-business-logic-${var.environment}"
  role          = aws_iam_role.lambda_iam.arn
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  timeout       = "7"
  memory_size   = "1024"
  #s3_bucket     = "image-generator-${var.environment}"
  # s3_key        = "bundle.zip"

  filename         = "./function/${var.environment}/bundle.zip"
  source_code_hash = filebase64sha256("./function/${var.environment}/bundle.zip")
  environment {
    variables = {
      ACCESS_KEY_ID     = var.access_key
      SECRET_ACCESS_KEY = var.secret_key
      REGION            = var.region
      ENVIRONMENT       = var.environment
      API_KEY           = var.api_key
      OPENSEA_API_KEY   = var.opensea_api_key
      gameAPI_KEY       = var.gameon_api_key

    }
  }
  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.alexa_business_logic,
  ]

}

# Create the Log Group
resource "aws_cloudwatch_log_group" "alexa_business_logic" {
  name              = "/aws/lambda/${var.function_name}-${var.environment}"
  retention_in_days = 14
}

# create the Alexa trigger on the main function
resource "aws_lambda_permission" "alexa_trigger" {
  statement_id       = "AllowExecutionFromAlexa"
  action             = "lambda:InvokeFunction"
  function_name      = aws_lambda_function.alexa_business_logic.function_name
  principal          = "alexa-appkit.amazon.com"
  event_source_token = var.alexa_skill_id
}

# Create The Alias 
resource "aws_lambda_alias" "alexa" {
  name             = var.alias_name
  description      = " alias for alexa skill"
  function_name    = aws_lambda_function.alexa_business_logic.arn
  function_version = var.function_version
}

#Create the trigger for the Alias
resource "aws_lambda_permission" "alexa_alias" {
  statement_id       = "AllowAliasExecutionFromAlexa"
  action             = "lambda:InvokeFunction"
  function_name      = aws_lambda_alias.alexa.arn
  principal          = "alexa-appkit.amazon.com"
  event_source_token = var.alexa_skill_id

}


########################################################
########### UK LAMBDA ALEXA BUSINESS LOGIC
#####################################################
resource "aws_lambda_function" "alexa_business_logic_uk" {
  provider      = aws.uk_provider
  function_name = "alexa-${var.function_name}-business-logic-${var.environment}"
  role          = aws_iam_role.lambda_iam.arn
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  timeout       = "7"
  memory_size   = "1024"
  # s3_bucket     = "image-generator-${var.environment}"
  # s3_key        = "bundle.zip"

  filename         = "./function/${var.environment}/bundle.zip"
  source_code_hash = filebase64sha256("./function/${var.environment}/bundle.zip")
  environment {
    variables = {
      ACCESS_KEY_ID     = var.access_key
      SECRET_ACCESS_KEY = var.secret_key
      REGION            = var.region
      ENVIRONMENT       = var.environment
      API_KEY           = var.api_key
      OPENSEA_API_KEY   = var.opensea_api_key
      gameAPI_KEY       = var.gameon_api_key
    }
  }
  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.alexa_business_logic,
  ]

}

resource "aws_cloudwatch_log_group" "alexa_business_logic_uk" {
  provider          = aws.uk_provider
  name              = "/aws/lambda/${var.function_name}-${var.environment}"
  retention_in_days = 14
}

resource "aws_lambda_permission" "alexa_trigger_uk" {
  provider           = aws.uk_provider
  statement_id       = "AllowExecutionFromAlexa"
  action             = "lambda:InvokeFunction"
  function_name      = aws_lambda_function.alexa_business_logic.function_name
  principal          = "alexa-appkit.amazon.com"
  event_source_token = var.alexa_skill_id

}

resource "aws_lambda_alias" "alexa_uk" {
  provider         = aws.uk_provider
  name             = var.alias_name
  description      = " alias for alexa skill"
  function_name    = aws_lambda_function.alexa_business_logic_uk.arn
  function_version = var.function_version
}

resource "aws_lambda_permission" "alexa_alias_uk" {
  provider           = aws.uk_provider
  statement_id       = "AllowAliasExecutionFromAlexa"
  action             = "lambda:InvokeFunction"
  function_name      = aws_lambda_alias.alexa_uk.arn
  principal          = "alexa-appkit.amazon.com"
  event_source_token = var.alexa_skill_id

}

########################################################
########### AU/AP LAMBDA ALEXA BUSINESS LOGIC
#####################################################
resource "aws_lambda_function" "alexa_business_logic_ap" {
  provider      = aws.ap_provider
  function_name = "alexa-${var.function_name}-business-logic-${var.environment}"
  role          = aws_iam_role.lambda_iam.arn
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  timeout       = "7"
  memory_size   = "1024"
  #s3_bucket     = "image-generator-${var.environment}"
  # s3_key        = "bundle.zip"

  filename         = "./function/${var.environment}/bundle.zip"
  source_code_hash = filebase64sha256("./function/${var.environment}/bundle.zip")
  environment {
    variables = {
      ACCESS_KEY_ID     = var.access_key
      SECRET_ACCESS_KEY = var.secret_key
      REGION            = var.region
      ENVIRONMENT       = var.environment
      API_KEY           = var.api_key
      OPENSEA_API_KEY   = var.opensea_api_key
      gameAPI_KEY       = var.gameon_api_key



    }
  }
  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.alexa_business_logic,
  ]

}

resource "aws_cloudwatch_log_group" "alexa_business_logic_ap" {
  provider          = aws.ap_provider
  name              = "/aws/lambda/${var.function_name}-${var.environment}"
  retention_in_days = 14
}

resource "aws_lambda_permission" "alexa_trigger_ap" {
  provider           = aws.ap_provider
  statement_id       = "AllowExecutionFromAlexa"
  action             = "lambda:InvokeFunction"
  function_name      = aws_lambda_function.alexa_business_logic.function_name
  principal          = "alexa-appkit.amazon.com"
  event_source_token = var.alexa_skill_id

}

resource "aws_lambda_alias" "alexa_ap" {
  provider         = aws.ap_provider
  name             = var.alias_name
  description      = " alias for alexa skill"
  function_name    = aws_lambda_function.alexa_business_logic_ap.arn
  function_version = var.function_version
}

resource "aws_lambda_permission" "alexa_alias_ap" {
  provider           = aws.ap_provider
  statement_id       = "AllowAliasExecutionFromAlexa"
  action             = "lambda:InvokeFunction"
  function_name      = aws_lambda_alias.alexa_ap.arn
  principal          = "alexa-appkit.amazon.com"
  event_source_token = var.alexa_skill_id

}


########################################################
########### SHARED RESOURCES TO ALLOW LOGGING, DYNAMO DB & OTHER PERMISSIONS
#####################################################
# - to do restrict to only the required permissions

#lambda role
resource "aws_iam_role" "lambda_iam" {
  name               = "${var.lambda_role_name}-${var.environment}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Lamba policy
resource "aws_iam_policy" "lambda_logging" {
  name        = "terraformed-alexa-${var.application}-logging-${var.environment}"
  path        = "/"
  description = "IAM policy for logging from a lambda plus s3 dynamo db and sqs "
  # to do add additional permissions
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    },
     {
        "Effect": "Allow",
        "Action": "s3:*",
        "Resource": "*"
    },
     {
        "Effect": "Allow",
        "Action": "dynamodb:*",
        "Resource": "*"
    }, 
    {
       "Effect": "Allow",
       "Action": "sqs:ListQueues",
        "Resource": "*"
    },
    {
        "Effect": "Allow",
        "Action": "sqs:*",
        "Resource": "arn:aws:sqs:*:*:*"
    }
  ]
}
EOF
}

# Attach the policy
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_iam.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}


########################################################
########### OUTPUTS TO CONFIGUE ALEXA SKILL
#####################################################

# DEFAULT LAMDA
output "lambda_arn" {
  value = aws_lambda_function.alexa_business_logic.arn
}

output "alias_arn" {
  value = aws_lambda_alias.alexa.arn
}

output "alias_uk_arn" {
  value = aws_lambda_alias.alexa_uk.arn
}

output "alias_ap_arn" {
  value = aws_lambda_alias.alexa_ap.arn
}

