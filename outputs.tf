//output "all-ns" {
//  value = data.kubernetes_all_namespaces.allns.namespaces
//}
//
//output "ns-present" {
//  value = contains(data.kubernetes_all_namespaces.allns.namespaces, "kube-system")
//}

output "cluster_network_load_balancer_url" {
  value = module.rke-cluster.network-load_balancer_url
}

output "cluster_kubeconfig_yaml" {
  value = module.rke-cluster.kubeconfig_yaml
}

output "cluster_export_kubeconfig_command" {
  value = module.rke-cluster.export_kubeconfig_command
}

//output "kubeconfig" {
//  value = file(var.cluster_kubeconfig_path)
//}

//output "greeting" {
//  value = "Hello! :)"
//}

########################################################################################################################
# CERT-MANAGER
########################################################################################################################

//output "kubernetes_namespace_cert_manager_id" {
//  value = kubernetes_namespace.cert-manager.id
//}
//
########################################################################################################################
# KUBERNETES
########################################################################################################################

//output "set_kubeconfig_command" {
//  value = "export KUBECONFIG=${var.cluster_kubeconfig_path}"
//}
