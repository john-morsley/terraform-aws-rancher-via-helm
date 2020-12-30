#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

########################################################################################################################
# VPC
########################################################################################################################

variable "vpc_cidr" {
  type = string
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

########################################################################################################################
# CLUSTER
########################################################################################################################

variable "cluster_name" {
  type = string
}

variable "node_settings" {
  type = list(
    object({
      role          = list(string)
      instance_type = string
    })
  )
  default = []
}


# Rancher...

variable "name" {
  type        = string
  default     = "rancher"
  description = "Name for deployment."
}

variable "domain" {
  type    = string
  default = "morsley.io"
}

variable "route_53_domain" {
  type    = string
  default = "" # Leave blank if this is the same as the above domain.
}

########################################################################################################################
# RANCHER
########################################################################################################################

variable "rancher_helm_repository" {
  type        = string
  default     = "https://releases.rancher.com/server-charts/latest"
  description = "Helm chart to use for Rancher install"
}

variable "rancher_helm_chart" {
  type        = string
  default     = "rancher"
  description = "Helm chart to use for Rancher install"
}

variable "rancher_helm_version" {
  type        = string
  default     = "2.5.3"
  description = "Version of Rancher to install."
}

variable "cluster_kubeconfig_path" {
  type        = string
  default     = "./../kube/kubeconfig.yaml"
  description = "Version of Rancher to install."
}

########################################################################################################################
# CERT-MANAGER
########################################################################################################################

variable "cert_manager_helm_repository" {
  type        = string
  default     = "https://charts.jetstack.io"
  description = "Helm chart to use for Cert-Manager install"
}

variable "cert_manager_helm_chart" {
  type        = string
  default     = "cert-manager"
  description = "Helm chart to use for Rancher install"
}

variable "cert_manager_version" {
  type        = string
  default     = "1.0.4"
  description = "Version of Cert-Manager to install."
}

variable "lets_encrypt_email" {
  type    = string
  default = "john@morsley.io"
}

variable "lets_encrypt_environment" {
  type    = string
  default = "staging" # Valid options are 'staging' or 'production'
}
