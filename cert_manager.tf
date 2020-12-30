//resource "null_resource" "cert-manager-crds" {
//  provisioner "local-exec" {
//    command = <<EOF
//kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/v${var.cert_manager_version}/deploy/manifests/00-crds.yaml
//kubectl create namespace cert-manager
//kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
//EOF
//    
//    environment = {
//      KUBECONFIG = var.cluster_kubeconfig_path
//    }
//  }
//}

//resource "helm_release" "cert_manager" {
//  //depends_on = [null_resource.cert-manager-crds]
//  version    = "v${var.cert_manager_version}"
//  name       = "cert-manager"
//  chart      = var.cert_manager_helm_chart
//  namespace  = "cert-manager"
//  repository = var.cert_manager_helm_repository
//
//  set {
//    name = "installCRDs"
//    value = "true"
//  }
//  
//  # Bogus set to link together resources for proper tear down
//  //set {
//  //  name  = "tf_link"
//  //  value = rke_cluster.rancher_server.api_server_url
//  //}
//  
//  depends_on = [
//    kubernetes_namespace.cert-manager
//  ]
//  
//}