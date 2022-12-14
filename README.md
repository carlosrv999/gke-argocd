# GKE ArgoCD Demo

- Seguir el tutorial en el siguiente [enlace](https://medium.com/@carlos.rv125/gitops-con-argocd-en-google-kubernetes-engine-demo-2bc9e0b3a84c).

## Requirements

1. gcloud cli
2. terraform

## Terraform Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.32.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.32.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_global_address.default](https://registry.terraform.io/providers/hashicorp/google/4.32.0/docs/resources/compute_global_address) | resource |
| [google_compute_network.default](https://registry.terraform.io/providers/hashicorp/google/4.32.0/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.default_1](https://registry.terraform.io/providers/hashicorp/google/4.32.0/docs/resources/compute_subnetwork) | resource |
| [google_compute_subnetwork.default_2](https://registry.terraform.io/providers/hashicorp/google/4.32.0/docs/resources/compute_subnetwork) | resource |
| [google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google/4.32.0/docs/resources/container_cluster) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_public_ip"></a> [load\_balancer\_public\_ip](#output\_load\_balancer\_public\_ip) | Global load balancer IP Address |
