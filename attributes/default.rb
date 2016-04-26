default["cida-auth"]["version"]["cida_auth"] = "1.1.9"
default["cida-auth"]["version"]["manager_console"] = "1.1.9"
default["cida-auth"]["version"]["manager_core"] = "1.1.9"

default["cida-auth"]["credentials_data_bag_name"] = "cida-auth-credentials-_default"
default["cida-auth"]["credentials_data_bag_item"] = "credentials"

# Set for the type of database that CIDA Auth will interface with
default["cida-auth"]["database"]["data_bag_username_field"] = "database.username"
default["cida-auth"]["database"]["data_bag_password_field"] = "database.password"
default["cida-auth"]["database"]["type"] = "oracle"
default["cida-auth"]["database"]["schema_name"] = "cida_auth"
default["cida-auth"]["database"]["name"] = "oracle"
default["cida-auth"]["database"]["host"] = "127.0.0.1"
default["cida-auth"]["database"]["port"] = "1521"
default["cida-auth"]["database"]["liquibase"]["runas"] = "oracle"
default["cida-auth"]["database"]["jdbc_maven_artifact_id"] = "ojdbc6" # Oracle Only
default["cida-auth"]["database"]["jdbc_driver_location"] = "/root/ojdbc6.jar" # Oracle Only
default["cida-auth"]["database"]["jdbc_driver_version"] = "11.2.0.3-1" # Oracle Only

default["cida-auth"]["tomcat"]["auth.oauth.required.domain"] = "usgs.gov"
default["cida-auth"]["tomcat"]["auth.oauth.endpoint"] = "https://accounts.google.com/o/oauth2/v2/auth"

