default["cida-auth"]["cida_auth_version"] = "1.1.8"

default["cida-auth"]["credentials_data_bag_name"] = "cida-auth-credentials-_default"
default["cida-auth"]["credentials_data_bag_item"] = "credentials"
default["cida-auth"]["data_bag_username_field"] = "database.username"
default["cida-auth"]["data_bag_password_field"] = "database.password"

# Set for the type of database that CIDA Auth will interface with
default["cida-auth"]["database"]["type"] = "oracle"
default["cida-auth"]["database"]["schema_name"] = "cida_auth"
default["cida-auth"]["database"]["name"] = "oracle"
default["cida-auth"]["database"]["host"] = "127.0.0.1"
default["cida-auth"]["database"]["port"] = "1521"
default["cida-auth"]["database"]["liquibase"]["runas"] = "oracle"
default["cida-auth"]["database"]["jdbc_maven_artifact_id"] = "ojdbc6" # Oracle Only
default["cida-auth"]["database"]["jdbc_driver_location"] = "/root/ojdbc6.jar" # Oracle Only
default["cida-auth"]["database"]["jdbc_driver_version"] = "11.2.0.3-1" # Oracle Only

default["cida-auth"]["database"]["db_connection"] = "jdbc:oracle:thin:@127.0.1:1521:cidaauth"

default["cida-auth"]["tomcat"]["manager.core.source.war"] = "http://cida.usgs.gov/maven/cida-public-releases/gov/usgs/cida/auth/auth-manager-core/1.0.3/auth-manager-core-1.0.3.war"
default["cida-auth"]["tomcat"]["manager.core.final.name"] = "auth-manager-core"
default["cida-auth"]["tomcat"]["manager.source.war"] = "http://cida.usgs.gov/maven/cida-public-releases/gov/usgs/cida/auth/auth-manager-console/1.0.3/auth-manager-console-1.0.3.war"
default["cida-auth"]["tomcat"]["manager.final.name"] = "auth-manager-console"
default["cida-auth"]["tomcat"]["cida.auth.source.war"] = "http://cida.usgs.gov/maven/cida-public-releases/gov/usgs/cida/auth/auth-webservice/1.1.3/auth-webservice-1.1.3.war"
default["cida-auth"]["tomcat"]["cida.auth.final.name"] = "auth-webservice"
default["cida-auth"]["tomcat"]["development"] = "true"
default["cida-auth"]["tomcat"]["auth.ldap.url"] = "ldaps://host:3269"
default["cida-auth"]["tomcat"]["auth.ldap.domain"] = "DC=gs,DC=doi,dc=net"
default["cida-auth"]["tomcat"]["auth.ldap.bind.user.prefix"] = ""
default["cida-auth"]["tomcat"]["auth.ldap.bind.user.suffix"] = "@gs.doi.net"
default["cida-auth"]["tomcat"]["auth.manager.password.algorithm"] = "SHA1"
default["cida-auth"]["tomcat"]["auth.manager.core.rest.url"] = "https://localhost=>8443/auth-manager-core/rest/"
default["cida-auth"]["tomcat"]["auth.manager.core.host"] = "localhost"
default["cida-auth"]["tomcat"]["auth.manager.core.port"] = "8443"
default["cida-auth"]["tomcat"]["auth.manager.core.scheme"] = "https"
default["cida-auth"]["tomcat"]["auth.oauth.required.domain"] = "usgs.gov"
default["cida-auth"]["tomcat"]["auth.oauth.endpoint"] = "https://accounts.google.com/o/oauth2/v2/auth"
default["cida-auth"]["tomcat"]["encrypted_environments_data_bag"]["data_bag_name"] = "credentials-data-bag"
default["cida-auth"]["tomcat"]["encrypted_environments_data_bag"]["data_bag_item"] = "credentials"
default["cida-auth"]["tomcat"]["encrypted_environments_data_bag"]["key_location"] = "/etc/chef/data-bag-encryption-key"
default["cida-auth"]["tomcat"]["encrypted_environments_data_bag"]["extract_fields"] = ["auth.manager.username", "auth.manager.password", "auth.oauth.client.id", "auth.oath.client.secret"]
default["cida-auth"]["tomcat"]["wsi_tomcat_keys_config"]["data_bag_name"] = "keystore-data-bag"
default["cida-auth"]["tomcat"]["wsi_tomcat_keys_config"]["data_bag_item"] = "keystore-config"
default["cida-auth"]["tomcat"]["wsi_tomcat_keys_config"]["key_location"] = "/etc/chef/data-bag-encryption-key"
