location               = "East US"
resource_group_name    = "your-resource-group"
app_service_plan_id    = "your-app-service-plan-id"
storage_account_name   = "your-storage-account-name"
storage_account_access_key = "your-storage-account-access-key"
function_app_name      = "your-function-app-name"

app_settings = {
  "Setting1" = "Value1"
  "Setting2" = "Value2"
  # Add other app settings here as needed...
}

connection_string = {
  name = "MyConnectionString"
  type = "SQLServer"
  value = "Server=myserver;Database=mydb;User Id=myuser;Password=mypassword;"
}

site_config = {
  always_on            = true
  app_scale_limit      = 10
  dotnet_framework_version = "v5.0"
  elastic_instance_minimum = 2
  ftps_state           = "AllAllowed"
  health_check_path    = "/health"
  http2_enabled        = true
  java_version         = "11"
  linux_fx_version     = "DOCKER|golang:latest"
  pre_warmed_instance_count = 5
  scm_ip_restriction   = [
    {
      ip_address         = "192.168.0.1/24"
      name               = "IPRestriction1"
      priority           = 100
      action             = "Allow"
    },
    {
      service_tag        = "AzureFrontDoor.Backend"
      name               = "IPRestriction2"
      priority           = 200
      action             = "Allow"
    },
  ]
  scm_type             = "GitHub"
  scm_use_main_ip_restriction = false
  use_32_bit_worker_process = true
  vnet_route_all_enabled = true
  websockets_enabled   = true

  cors = {
    allowed_origins     = ["https://example.com", "https://api.example.com"]
    support_credentials = true
  }
}

version = "~3"

tags = {
  environment = "dev"
  project     = "my-project"
}

# Auth Settings
auth_settings = {
  enabled                  = true

  active_directory = {
    client_id          = "your-client-id"
    client_secret      = "your-client-secret"
    allowed_audiences  = ["allowed_audience_1", "allowed_audience_2"]
  }

  additional_login_params           = "param1=value1,param2=value2"
  allowed_external_redirect_urls    = ["https://example.com", "https://another-example.com"]
  default_provider                  = "AzureActiveDirectory"

  facebook = {
    app_id        = "your-facebook-app-id"
    app_secret    = "your-facebook-app-secret"
    oauth_scopes  = ["email", "user_friends"]
  }

  google = {
    client_id      = "your-google-client-id"
    client_secret  = "your-google-client-secret"
    oauth_scopes   = ["https://www.googleapis.com/auth/plus.login"]
  }

  issuer = "https://sts.windows.net/<tenant-id>/"

  microsoft = {
    client_id     = "your-microsoft-client-id"
    client_secret = "your-microsoft-client-secret"
    oauth_scopes  = ["https://graph.microsoft.com/user.read"]
  }

  runtime_version        = "~3"
  token_refresh_extension_hours = 72
  token_store_enabled    = true

  twitter = {
    consumer_key     = "your-twitter-consumer-key"
    consumer_secret  = "your-twitter-consumer-secret"
  }

  unauthenticated_client_action = "AllowAnonymous"
}
