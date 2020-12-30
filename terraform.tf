terraform {

  required_version = ">= 0.14"

  required_providers {
    rancher2 = {
      source  = "rancher/rancher2"
      version = ">= 1.6.0"
    }
  }

}