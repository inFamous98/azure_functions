resource "azurerm_function_app" "example" {
  name                      = var.function_app_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  app_service_plan_id       = var.app_service_plan_id
  app_settings              = var.app_settings
  connection_string         = var.connection_string
  client_cert_mode          = var.client_cert_mode
  daily_memory_time_quota   = var.daily_memory_time_quota
  enabled                   = var.enabled
  enable_builtin_logging    = var.enable_builtin_logging
  https_only                = var.https_only
  identity                  = var.identity
  key_vault_reference_identity_id = var.key_vault_reference_identity_id
  os_type                   = var.os_type
  site_config               = var.site_config
  source_control            = var.source_control
  storage_account_name      = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  version                   = var.version
  tags                      = var.tags

  # Auth Settings Block
  dynamic "auth_settings" {
    for_each = var.auth_settings.enabled ? [1] : []

    content {
      enabled = var.auth_settings.enabled

      dynamic "active_directory" {
        for_each = var.auth_settings.active_directory != null ? [1] : []

        content {
          client_id          = var.auth_settings.active_directory.client_id
          client_secret      = var.auth_settings.active_directory.client_secret
          allowed_audiences  = var.auth_settings.active_directory.allowed_audiences
        }
      }

      additional_login_params           = var.auth_settings.additional_login_params
      allowed_external_redirect_urls    = var.auth_settings.allowed_external_redirect_urls
      default_provider                  = var.auth_settings.default_provider

      dynamic "facebook" {
        for_each = var.auth_settings.facebook != null ? [1] : []

        content {
          app_id        = var.auth_settings.facebook.app_id
          app_secret    = var.auth_settings.facebook.app_secret
          oauth_scopes  = var.auth_settings.facebook.oauth_scopes
        }
      }

      dynamic "google" {
        for_each = var.auth_settings.google != null ? [1] : []

        content {
          client_id      = var.auth_settings.google.client_id
          client_secret  = var.auth_settings.google.client_secret
          oauth_scopes   = var.auth_settings.google.oauth_scopes
        }
      }

      issuer = var.auth_settings.issuer

      dynamic "microsoft" {
        for_each = var.auth_settings.microsoft != null ? [1] : []

        content {
          client_id     = var.auth_settings.microsoft.client_id
          client_secret = var.auth_settings.microsoft.client_secret
          oauth_scopes  = var.auth_settings.microsoft.oauth_scopes
        }
      }

      runtime_version                = var.auth_settings.runtime_version
      token_refresh_extension_hours  = var.auth_settings.token_refresh_extension_hours
      token_store_enabled            = var.auth_settings.token_store_enabled

      dynamic "twitter" {
        for_each = var.auth_settings.twitter != null ? [1] : []

        content {
          consumer_key     = var.auth_settings.twitter.consumer_key
          consumer_secret  = var.auth_settings.twitter.consumer_secret
        }
      }

      unauthenticated_client_action  = var.auth_settings.unauthenticated_client_action
    }
  }
  connection_string {
    name = var.connection_string.name
    type = var.connection_string.type
    value = var.connection_string.value
  }

  site_config {
    always_on            = var.site_config.always_on
    app_scale_limit      = var.site_config.app_scale_limit
    dotnet_framework_version = var.site_config.dotnet_framework_version
    elastic_instance_minimum = var.site_config.elastic_instance_minimum
    ftps_state           = var.site_config.ftps_state
    health_check_path    = var.site_config.health_check_path
    http2_enabled        = var.site_config.http2_enabled
    java_version         = var.site_config.java_version
    linux_fx_version     = var.site_config.linux_fx_version
    pre_warmed_instance_count = var.site_config.pre_warmed_instance_count
    scm_ip_restriction   = var.site_config.scm_ip_restriction
    scm_type             = var.site_config.scm_type
    scm_use_main_ip_restriction = var.site_config.scm_use_main_ip_restriction
    use_32_bit_worker_process = var.site_config.use_32_bit_worker_process
    vnet_route_all_enabled = var.site_config.vnet_route_all_enabled
    websockets_enabled   = var.site_config.websockets_enabled

    cors {
      allowed_origins     = var.site_config.cors.allowed_origins
      support_credentials = var.site_config.cors.support_credentials
    }

  tags = var.tags
}
}