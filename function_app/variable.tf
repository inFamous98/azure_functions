variable "function_app_name" {
  description = "The name of the Azure Function App."
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Function App."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan within which to create this Function App."
  type        = string
}

variable "app_settings" {
  description = "A map of key-value pairs for App Settings and custom values."
  type        = map(string)
  default     = {}
}

variable "auth_settings" {
  description = "An auth_settings block as defined below."
  type        = object({
    enabled                  = bool
    active_directory         = object({
      client_id              = string
      client_secret          = string
      allowed_audiences       = list(string)
    })
    additional_login_params  = map(string)
    allowed_external_redirect_urls = list(string)
    default_provider        = string
    facebook                = object({
      app_id                 = string
      app_secret             = string
      oauth_scopes           = list(string)
    })
    google                  = object({
      client_id              = string
      client_secret          = string
      oauth_scopes           = list(string)
    })
    issuer                  = string
    microsoft               = object({
      client_id              = string
      client_secret          = string
      oauth_scopes           = list(string)
    })
    runtime_version         = string
    token_refresh_extension_hours = number
    token_store_enabled     = bool
    twitter                 = object({
      consumer_key           = string
      consumer_secret        = string
    })
    unauthenticated_client_action = string
  })
}

variable "connection_string" {
  description = "A connection_string block as defined below."
  type        = object({
    name       = string
    type       = string
    value      = string
  })
}

variable "client_cert_mode" {
  description = "The mode of the Function App's client certificates requirement for incoming requests. Possible values are Required and Optional."
  type        = string
}

variable "daily_memory_time_quota" {
  description = "The amount of memory in gigabyte-seconds that your application is allowed to consume per day. Setting this value only affects function apps under the consumption plan."
  type        = number
}

variable "enabled" {
  description = "Is the Function App enabled? Defaults to true."
  type        = bool
  default     = true
}

variable "enable_builtin_logging" {
  description = "Should the built-in logging of this Function App be enabled? Defaults to true."
  type        = bool
  default     = true
}

variable "https_only" {
  description = "Can the Function App only be accessed via HTTPS? Defaults to false."
  type        = bool
  default     = false
}

variable "min_tls_version" {
  description = "The minimum supported TLS version for the function app. Possible values are 1.0, 1.1, and 1.2. Defaults to 1.2 for new function apps."
  type        = string
  default     = "1.2"
}

variable "runtime_scale_monitoring_enabled" {
  description = "Should Runtime Scale Monitoring be enabled? Only applicable to apps on the Premium plan. Defaults to false."
  type        = bool
  default     = false
}

variable "websockets_enabled" {
  description = "Should WebSockets be enabled?"
  type        = bool
  default     = false
}

variable "auto_swap_slot_name" {
  description = "The name of the slot to automatically swap to during deployment. This attribute is only used for slots."
  type        = string
}