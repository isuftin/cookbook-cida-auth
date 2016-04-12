# cookbook-cida-auth

See environments folder for how to config chef environment.

#### To run Test Kitchen against Oracle:
- Create the oracle encrypted credentials data bag for testing:
`$ cp test/integration/default/data_bags/cida-auth-credentias-_default/credentials-oracle.json test/integration/default/data_bags/cida-auth-credentias-_default/credentials.json`
- Get the [OJDBC JAR](http://www.oracle.com/technetwork/apps-tech/jdbc-112010-090769.html) and copy it to test/files/ojdbc6.jar
- Run a Docker Oracle XE instance using:
`$ docker run -p 1521:1521 wnameless/oracle-xe-11g`
- Set the Kitchen attributes in default to:
```
"cida-auth" : {

	"database" : {
	  "jdbc_driver_location" : "file:///tmp/kitchen/data/ojdbc6.jar",
	  "type" : "oracle",
	  "schema_name" : "",
	  "name" : "xe",
	  "host" : "192.168.99.100",
	  "liquibase" : {
	    "runas" : "oracle"
	  }
	}
}
```
- Replace the `host` attribute with the IP address of your Docker instance. 127.0.0.1 for Linux, `docker-machine ip <machine-name>` for Windows/Mac:
```
$ docker-machine ip dev
192.168.99.100
```

#### To run Test Kitchen against Postgres:
- Create the postgres encrypted credentials data bag for testing:
`$ cp test/integration/default/data_bags/cida-auth-credentias-_default/credentials-postgres.json test/integration/default/data_bags/cida-auth-credentias-_default/credentials.json`
- Run a Postgres instance using:
`$ docker run -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres postgres`
- Set the Kitchen attributes in default to:
```
"cida-auth" : {

	"database" : {
	  "type" : "postgres",
	  "schema_name" : "public",
	  "name" : "postgres",
	  "host" : "192.168.99.100",
	  "liquibase" : {
	    "runas" : "postgres"
	  }
	}
}
```
- Replace the `host` attribute with the IP address of your Docker instance. 127.0.0.1 for Linux, `docker-machine ip <machine-name>` for Windows/Mac:
```
$ docker-machine ip dev
192.168.99.100
```
