locals {

  full_env_code           = format("%s%s%s", lower(var.environment_code), lower(var.deployment_code), lower(var.location_code))
  full_env_code_secondary = format("%s%s%s", lower(var.environment_code), lower(var.deployment_code), lower(var.location_code_secondary))
  default_tags            = {}
  default_ip_whitelist    = ["73.69.125.243"]

  vm_generic_map = {
    full_env_code               = local.full_env_code
    platform_fault_domain_count = var.platform_fault_domain_count
    location                    = var.location
    location_secondary          = var.location_secondary
    ssh_key_path                = var.ssh_key_path
    deploy_using_zones          = var.deploy_using_zones
    recovery_services_map       = jsonencode(module.recovery-vault.outputs)
  }
}
