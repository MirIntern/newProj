terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~>3.0"
		}
	}
}

provider "aws" {
	region = "us-east-1"
	access_key = "AKIAXHI4DZ6WEPMI3XAR"
	secret_key = "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"
}
