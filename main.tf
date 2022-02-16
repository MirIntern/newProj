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
	access_key = "AKIAXHI4DZ6WIGUDWNHZ"
	secret_key = "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"
}
