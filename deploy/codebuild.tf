# resource "aws_s3_bucket" "example" {
#   bucket = "exampletestingterrastartup"
#   acl    = "private"
#   tags = {
#     Name = "example_testing_terrastartup"
#   }
# }
#
# resource "aws_iam_role" "example" {
#   name = "example"
#
#   assume_role_policy = <<EOF
# {
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": {
#         "Service": "codebuild.amazonaws.com"
#       },
#       "Action": "sts:AssumeRole"
#     }
#   ]
# }
# EOF
# }
#
# resource "aws_iam_policy" "policy" {
#   name        = "test-policy"
#   description = "A test policy"
#   policy      = <<EOF
# {
# "Version": "2012-10-17",
# "Statement": [
#   {
#     "Sid": "CloudWatchLogsPolicy",
#     "Effect": "Allow",
#     "Action": [
#       "logs:CreateLogGroup",
#       "logs:CreateLogStream",
#       "logs:PutLogEvents"
#     ],
#     "Resource": [
#       "*"
#     ]
#   },
#   {
#     "Sid": "CodeCommitPolicy",
#     "Effect": "Allow",
#     "Action": [
#       "codecommit:GitPull"
#     ],
#     "Resource": [
#       "*"
#     ]
#   },
#   {
#     "Sid": "S3GetObjectPolicy",
#     "Effect": "Allow",
#     "Action": [
#       "s3:GetObject",
#       "s3:GetObjectVersion"
#     ],
#     "Resource": [
#       "*"
#     ]
#   },
#   {
#     "Sid": "S3PutObjectPolicy",
#     "Effect": "Allow",
#     "Action": [
#       "s3:PutObject"
#     ],
#     "Resource": [
#       "*"
#     ]
#   },
#   {
#     "Sid": "S3BucketIdentity",
#     "Effect": "Allow",
#     "Action": [
#       "s3:GetBucketAcl",
#       "s3:GetBucketLocation"
#     ],
#     "Resource": [
#       "*"
#     ]
#   }
# ]
# }
# EOF
# }
#
# resource "aws_iam_role_policy_attachment" "test-attach" {
#   role       = "${aws_iam_role.example.name}"
#   policy_arn = "${aws_iam_policy.policy.arn}"
# }
#
# resource "aws_codebuild_project" "example" {
#   name          = var.DOMAIN_NAME
#   description   = "A terrastartup codebuild project."
#   build_timeout = "5"
#   service_role  = "${aws_iam_role.example.arn}"
#
#   artifacts {
#     type = "NO_ARTIFACTS"
#   }
#
#   # cache {
#   #   type     = "S3"
#   #   location = "${aws_s3_bucket.example.bucket}"
#   # }
#
#   environment {
#     compute_type                = "BUILD_GENERAL1_SMALL"
#     image                       = "aws/codebuild/standard:1.0"
#     type                        = "LINUX_CONTAINER"
#     image_pull_credentials_type = "CODEBUILD"
#
#     # environment_variable {
#     #   name  = "SOME_KEY1"
#     #   value = "SOME_VALUE1"
#     # }
#     #
#     # environment_variable {
#     #   name  = "SOME_KEY2"
#     #   value = "SOME_VALUE2"
#     #   type  = "PARAMETER_STORE"
#     # }
#   }
#
#   logs_config {
#     cloudwatch_logs {
#       group_name  = "log-group"
#       stream_name = "log-stream"
#     }
#
#     s3_logs {
#       status   = "ENABLED"
#       location = "${aws_s3_bucket.example.id}/build-log"
#     }
#   }
#
#   source {
#     type            = "GITHUB"
#     location        = "https://github.com/danielptm/Terrastartup_frontend.git"
#     git_clone_depth = 1
#   }
#
#   # vpc_config {
#   #   vpc_id = "${aws_vpc.example.id}"
#   #
#   #   subnets = [
#   #     "${aws_subnet.example1.id}",
#   #     "${aws_subnet.example2.id}",
#   #   ]
#   #
#   #   security_group_ids = [
#   #     "${aws_security_group.example1.id}",
#   #     "${aws_security_group.example2.id}",
#   #   ]
#   # }
#
#   tags = {
#     Environment = "Test"
#   }
# }
