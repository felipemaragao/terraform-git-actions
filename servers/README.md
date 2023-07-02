<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_security_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnets.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az"></a> [az](#input\_az) | n/a | `string` | `"us-west-2a"` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | `"qualify"` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | n/a | `string` | `"hostname"` | no |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | n/a | `string` | `"ami-12345678"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_nome"></a> [nome](#input\_nome) | n/a | `string` | `"padrao"` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | n/a | `string` | n/a | yes |
| <a name="input_root_block_device_delete_on_termination"></a> [root\_block\_device\_delete\_on\_termination](#input\_root\_block\_device\_delete\_on\_termination) | n/a | `bool` | `true` | no |
| <a name="input_root_block_device_volume_size"></a> [root\_block\_device\_volume\_size](#input\_root\_block\_device\_volume\_size) | n/a | `string` | `"8"` | no |
| <a name="input_root_block_device_volume_type"></a> [root\_block\_device\_volume\_type](#input\_root\_block\_device\_volume\_type) | n/a | `string` | `"gp2"` | no |
| <a name="input_subnet_tier"></a> [subnet\_tier](#input\_subnet\_tier) | Tier of subnets (Publkic or Private) | `string` | `"private"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags do recurso | `map(string)` | <pre>{<br>  "Ambiente": "Desenvolvimento",<br>  "Name": "lab-terraform-tst"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | n/a |
<!-- END_TF_DOCS -->