CIDA Auth Chef Cookbook Changelog
=================================

0.2.5
-----

- [isuftin@usgs.gov] - Change when Liquibase runs take place

0.2.4
-----

- [isuftin@usgs.gov] - Updated to using new Tomcat cookbook version

0.2.3
-----

- [isuftin@usgs.gov] - Took out recipe which directly calls on the wsi_tomcat cookbook and instead
	moved that into Kitchen configuration
- [isuftin@usgs.gov] - Split out iptables configuration into own recipe
- [isuftin@usgs.gov] - Updated release version for the CIDA Auth app in attributes 
- [isuftin@usgs.gov] - Added issues and source url
- [isuftin@usgs.gov] - Updated to Tomcat 8.0.36 in Test Kitchen
- [isuftin@usgs.gov] - Moved versioning out to Berksfile for third party cookbooks
- [isuftin@usgs.gov] - Adding Vagrantfile to allow users without ChefDK installed to test

0.2.2
-----

- [isuftin@usgs.gov] - Updated to latest CIDA Auth version. 

0.2.1
-----

- [isuftin@usgs.gov] - Tested as working with both Oracle and Postgres and the WSI Tomcat cookbook 
- [isuftin@usgs.gov] - Added more testing. 


0.2.0
-----

- Added test kitchen harness
- Added serverspec testing
- Moved node attribute injection functionality out
- Updated Liquibase dataase initialisation to use cida-auth project 
- Securely writing settings file for Liquibase properties