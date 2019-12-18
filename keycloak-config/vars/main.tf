resource keycloak_realm internal {
  realm        = "internal"
  enabled      = true
  display_name = "internal"
}

resource keycloak_saml_identity_provider saml {
  realm                      = keycloak_realm.internal.id
  alias                      = "saml"
  single_sign_on_service_url = "http://saml2:8180/simplesaml/saml2/idp/SSOService.php"
  single_logout_service_url  = "http://saml2:8180/simplesaml/saml2/idp/SSOService.php"
  name_id_policy_format      = "Persistent"
}

resource keycloak_attribute_importer_identity_provider_mapper saml {
  realm                   = keycloak_realm.internal.id
  name                    = "email"
  attribute_name          = "email"
  identity_provider_alias = keycloak_saml_identity_provider.saml.alias
  user_attribute          = "email"
}

resource keycloak_attribute_importer_identity_provider_mapper first_name {
  realm                   = keycloak_realm.internal.id
  name                    = "firstName"
  attribute_name          = "email"
  identity_provider_alias = keycloak_saml_identity_provider.saml.alias
  user_attribute          = "firstName"
}

resource keycloak_attribute_importer_identity_provider_mapper last_name {
  realm                   = keycloak_realm.internal.id
  name                    = "lastName"
  attribute_name          = "email"
  identity_provider_alias = keycloak_saml_identity_provider.saml.alias
  user_attribute          = "lastName"
}
