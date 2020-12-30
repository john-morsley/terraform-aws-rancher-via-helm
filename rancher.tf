# Install Rancher...

//resource "helm_release" "rancher" {
//
//  name       = "rancher"
//  repository = var.rancher_helm_repository
//  chart      = var.rancher_helm_chart
//  version    = "v${var.rancher_helm_version}"
//  namespace  = "cattle-system"
//
//  set {
//    name  = "hostname"
//    value = "${var.name}.${var.domain}"
//  }
//
//  set {
//    name  = "ingress.tls.source"
//    value = "letsEncrypt"
//  }
//
//  set {
//    name  = "letsEncrypt.email"
//    value = var.lets_encrypt_email
//  }
//
//  set {
//    name  = "letsEncrypt.environment"
//    value = var.lets_encrypt_environment
//  }
//
//  # Bogus set to link togeather resources for proper tear down
////  set {
////    name  = "tf_link"
////    value = helm_release.cert_manager.name
////  }
//
//  depends_on = [
//    kubernetes_namespace.cattle-system,
//    helm_release.cert_manager
//  ]
//  
//}
//
//resource "null_resource" "wait_for_rancher" {
//
//  provisioner "local-exec" {
//    command = <<EOF
//while [ "$${subject}" != "*  subject: CN=$${RANCHER_HOSTNAME}" ]; do
//    subject=$(curl -vk -m 2 "https://$${RANCHER_HOSTNAME}/ping" 2>&1 | grep "subject:")
//    echo "Cert Subject Response: $${subject}"
//    if [ "$${subject}" != "*  subject: CN=$${RANCHER_HOSTNAME}" ]; then
//      sleep 10
//    fi
//done
//while [ "$${resp}" != "pong" ]; do
//    resp=$(curl -sSk -m 2 "https://$${RANCHER_HOSTNAME}/ping")
//    echo "Rancher Response: $${resp}"
//    if [ "$${resp}" != "pong" ]; then
//      sleep 10
//    fi
//done
//EOF
//
//    environment = {
//      RANCHER_HOSTNAME = "${var.name}.${var.domain}"
//      TF_LINK          = helm_release.rancher.name
//    }
//  }
//
//}