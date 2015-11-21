default["cida_auth"] = {
	"cida_auth_version" => "1.1.0",
	"schema_name" => "public",
	"jdbc_driver_source" => "https://jdbc.postgresql.org/download/postgresql-9.4-1205.jdbc41.jar",
	"jdbc_driver_filename" => "postgresql-9.4-1205.jdbc41.jar",
	"jdbc_driver_class" => "org.postgresql.Driver",
	"jdbc_maven_group_id" => "org.postgresql",
	"jdbc_maven_artifact_id" => "postgresql",
	"jdbc_maven_version" => "9.4-1205-jdbc41",
	"db_connection" => "jdbc:postgresql://host:5432/cida_auth",
	"credentials_data_bag_name" => "cida_auth_dev_creds",
	"data_bag_encryption_key" => "/etc/chef/data-bag-encryption-key",
	"data_bag_username_field" => "database.username",
	"data_bag_password_field" => "database.password",
	"tomcat" => {
		"manager.core.source.war" => "http://cida.usgs.gov/maven/cida-public-releases/gov/usgs/cida/auth/auth-manager-core/1.1.0/auth-manager-core-1.1.0.war",
		"manager.core.final.name" => "auth-manager-core",
		"manager.source.war"=> "http://cida.usgs.gov/maven/cida-public-releases/gov/usgs/cida/auth/auth-manager-console/1.1.0/auth-manager-console-1.1.0.war",
		"manager.final.name" => "auth-manager-console",
		"cida.auth.source.war" => "http://cida.usgs.gov/maven/cida-public-releases/gov/usgs/cida/auth/auth-webservice/1.1.0/auth-webservice-1.1.0.war",
		"cida.auth.final.name" => "auth-webservice",
		"development" => "true",
		"auth.ldap.url" => "ldaps://host:3269",
		"auth.ldap.domain" => "DC=gs,DC=doi,dc=net",
		"auth.manager.password.algorithm" => "SHA1",
		"auth.manager.core.rest.url" => "https://localhost=>8443/auth-manager-core/rest/",
		"auth.manager.core.host" => "localhost",
		"auth.manager.core.port" => "8443",
		"auth.manager.core.scheme" => "https",
		"encrypted_environments_data_bag" => {
			"data_bag_name" => "cida_auth_dev_creds",
			"key_location" => "/etc/chef/data-bag-encryption-key",
			"extract_fields" => ["auth.manager.username", "auth.manager.password"]
		},
		"wsi_tomcat_keys_config" => {
			"data_bag_name" => "cida_auth_keystore_data_bag",
			"key_location" => "/etc/chef/data-bag-encryption-key"
		}
	}
}