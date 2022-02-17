# digitalocean_doks_demo

Setup a DigitalOcean Kubernetes Cluster with some addons and demo apps in a fully automated fashion.

## Overview

To build the nextcloud instance two technologies are used in combination:

- [Terraform](https://www.terraform.io/)
- [Ansible](https://www.ansible.com/)

To automatically run the tools Gitlab's [CI/CD](https://docs.gitlab.com/ee/ci/) software is used. Thus resulting in that "pipeline" that runs on every change and triggers Terraform and Ansible.

### Terraform

Terraform is an IaC tool that builds your infrastructure in the cloud based on definition written in code.

### Ansible

Ansible is a configuration management tool that works agentless using ssh and a lot of python code.

## Technical Insights

## Usage

### Preparations

Create a new Repository for your NC instance.

The following CI/CD variables must exist:

- `do_token`: Masked variable containing an API token for DigitalOcean Cloud
- `ansible_vault_password`: File variable containing the ansible_vault password used for the `secrets.yml` file

Then copy the files from this repository over to your new repository and edit the `settings.tfvars` as well as the `settings.yml` file to your likings.

```bash
ansible-vault create secrets.yml
```

The command will prompt you for a Vault password and then open an editor where you can enter the secure variables. Once you save, the command will save that file in your directory but in an encrypted way. If you do that, don't forget to add the vault password as CD/CD variable of type file and the name `ansible_vault_password`.

Once you commit your changes the pipeline should automatically trigger and build your NC instance.

## To Do

There is always a way to improve:

- [x] Add tools

---  

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | n/a |
| <a name="provider_hetznerdns"></a> [hetznerdns](#provider\_hetznerdns) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_server.nc_instance](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_ssh_key.ansible_key](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |
| [hcloud_volume.nc_volume](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume) | resource |
| [hetznerdns_record.nc_a](https://registry.terraform.io/providers/timohirt/hetznerdns/latest/docs/resources/record) | resource |
| [hetznerdns_record.nc_aaaa](https://registry.terraform.io/providers/timohirt/hetznerdns/latest/docs/resources/record) | resource |
| [hcloud_image.server_image](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/image) | data source |
| [hcloud_location.server_location](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/location) | data source |
| [hcloud_server_type.server_type](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/data-sources/server_type) | data source |
| [hetznerdns_zone.dns_zone](https://registry.terraform.io/providers/timohirt/hetznerdns/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ansible_ssh_key"></a> [ansible\_ssh\_key](#input\_ansible\_ssh\_key) | Path to SSH public key to inject into Cloud server for ansible user | `string` | n/a | yes |
| <a name="input_ansible_ssh_port"></a> [ansible\_ssh\_port](#input\_ansible\_ssh\_port) | SSH port for Cloud server | `number` | `58222` | no |
| <a name="input_ansible_user"></a> [ansible\_user](#input\_ansible\_user) | Username for the ansible user | `string` | `"ci"` | no |
| <a name="input_common_labels"></a> [common\_labels](#input\_common\_labels) | Map of labels to set on resources | `map(string)` | `{}` | no |
| <a name="input_dns_hostname"></a> [dns\_hostname](#input\_dns\_hostname) | Hostname of your server¨ | `string` | n/a | yes |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | DNS Zone your Nextcloud server should be in | `string` | n/a | yes |
| <a name="input_hcloud_dns_token"></a> [hcloud\_dns\_token](#input\_hcloud\_dns\_token) | Hetzner DNS Token for provider | `string` | n/a | yes |
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner Cloud Token for provider | `string` | n/a | yes |
| <a name="input_server_backups"></a> [server\_backups](#input\_server\_backups) | Enable server backups if needed | `bool` | `false` | no |
| <a name="input_server_image"></a> [server\_image](#input\_server\_image) | Image to use for the Cloud server | `string` | `"debian-11"` | no |
| <a name="input_server_location"></a> [server\_location](#input\_server\_location) | Location where your Cloud server should be located | `string` | `"hel1"` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Server type to use for the Cloud server | `string` | `"cx11"` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Size of the data volume | `number` | `50` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ansible_ssh_key"></a> [ansible\_ssh\_key](#output\_ansible\_ssh\_key) | Public SSH key for ansible user |
| <a name="output_ansible_ssh_port"></a> [ansible\_ssh\_port](#output\_ansible\_ssh\_port) | SSH port for Cloud server |
| <a name="output_ansible_user"></a> [ansible\_user](#output\_ansible\_user) | User for ansible to configure the system |
| <a name="output_dns_fqdn"></a> [dns\_fqdn](#output\_dns\_fqdn) | Fully qualified domain name of your nextcloud instance |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | IPv4 address of Cloud server |
| <a name="output_ipv6_address"></a> [ipv6\_address](#output\_ipv6\_address) | IPv6 address of Cloud server |
| <a name="output_ipv6_network"></a> [ipv6\_network](#output\_ipv6\_network) | IPv6 net of Cloud server |
<!-- END_TF_DOCS -->
