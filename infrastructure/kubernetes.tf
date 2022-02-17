module "kubernetes" {
  source  = "nlamirault/doks/digitalocean"
  version = "v0.3.0"

  cluster_name = "alleaffengaffen_ch"

  region = "fra1"

  # find version using `doctl kubernetes options versions`
  kubernetes_version = "1.21.9"
  auto_upgrade       = true
  size               = "s-2vcpu-4gb"

  auto_scale = true
  min_nodes  = 1
  max_nodes  = 5
  node_count = 1

  node_labels = {
    env        = "alleaffengaffen_ch"
    service    = "kubernetes"
    managed-by = "terraform"
  }

  node_tags = ["kubernetes", "nodes"]

  #node_pools = {
  #  "ops" = {
  #    auto_scale = true
  #    min_nodes = 1
  #    max_nodes = 3
  #    node_count = 1
  #    size = "s-1vcpu-2gb"
  #    node_labels = {
  #      env      = "prod"
  #      service  = "kubernetes"
  #      made-by  = "terraform"
  #  }
  #    node_tags = ["kubernetes", "nodes"]
  #  }
  #}

}
