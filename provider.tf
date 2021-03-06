provider "aws" {
  version = ">=2.0"
  region  = "us-east-2"
  //shared_credentials_file = "C:/Users/bprajapati/.aws/credentials"
  //profile                 = "opencloud"
}

terraform {
  backend "s3" {
    bucket         = "terraform-s3-bucket-test-1"
    key            = "terraform.tfstate"
    dynamodb_table = "terraform_lock"
    region         = "us-east-2"
    //shared_credentials_file = "C:/Users/bprajapati/.aws/credentials"
    //profile                 = "opencloud"
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}

provider "kubectl" {
  apply_retry_count      = 15
  host                   =              data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  load_config_file       = false

  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws-iam-authenticator"
    args = [
      "token",
      "-i",
      local.cluster_id,
    ]
  }
}