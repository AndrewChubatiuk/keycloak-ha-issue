terraform {
  required_providers {
    keycloak = ">= 1.12.0"
  }
}

provider keycloak {
  client_timeout = 30
}
