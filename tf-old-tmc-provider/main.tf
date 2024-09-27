// Tanzu Mission Control Cluster Type: Tanzu Kubernetes Grid Service workload.
// Operations supported : Read, Create, Update & Delete (except nodepools)

// Read Tanzu Mission Control Tanzu Kubernetes Grid Service workload cluster : fetch cluster details
// data "tanzu-mission-control_cluster" "ready_only_cluster_view" {
//   management_cluster_name = "h2o-2-24678" // Required
//   provisioner_name        = "david-clayton-tmc"          // Required
//   name                    = "david-clayton-oldtf"       // Required
// }

# Create Tanzu Mission Control Tanzu Kubernetes Grid Service workload cluster entry
resource "tanzu-mission-control_cluster" "create_tkgs_workload" {
  management_cluster_name = "h2o-2-24678" // Required
  provisioner_name        = "david-clayton-tmc"          // Required
  name                    = "david-clayton-oldtf"       // Required

  meta {
    labels = {
      "dc-provider-name" : "tanzu-mission-control",
      "dc-provider-version" : "1.1.5"
    }
  }

  spec {
    cluster_group = "david-clayton-msk" // Default: default
    tkg_service_vsphere {
      settings {
        network {
          pods {
            cidr_blocks = [
              "193.0.3.0/23", // Required ???
            ]
          }
          services {
            cidr_blocks = [
              "10.96.0.0/23", // Required ??
            ]
          }
        }
        storage {
          classes = [
            "vc01cl01-t0compute",
          ]
          default_class = "vc01cl01-t0compute"
        }
      }

      distribution {
        version = "v1.20.5+vmware.2-tkg.1" // Required ??
      }

      topology {
        control_plane {
          class             = "small"         // Required ???
          storage_class     = "vc01cl01-t0compute" // Required
          high_availability = false             // Default: false
        }
        node_pools {
          spec {
            worker_node_count = "1" // Required
            tkg_service_vsphere {
              class         = "small"         // Required ???
              storage_class = "vc01cl01-t0compute" // Required
            }
          }
          info {
            name = "david-clayton-msk-node-pool" // Required
          }
        }
      }
    }
  }
}
