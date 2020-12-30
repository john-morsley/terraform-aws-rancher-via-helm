provider "aws" {
  //region  = var.aws_region
  //profile = var.aws_profile
}

provider "aws" {
  alias = "r53"
}

//provider "rke" {}

provider "helm" {
  kubernetes {
    config_path = module.rke-cluster.kubeconfig_yaml
  }
}

//provider "rancher2" {
//  alias     = "bootstrap"
//  api_url   = "https://${var.name}.${var.domain}"
//  bootstrap = true
//}

//provider "rancher2" {
//  api_url   = "https://${local.name}.${local.domain}"
//  token_key = rancher2_bootstrap.admin.token
//}

//provider "kubernetes" {
//  load_config_file = true
//  config_path = var.cluster_kubeconfig_path
//}