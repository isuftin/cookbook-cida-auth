name             'cida-auth'
maintainer       'Phethala Thongsavanh'
maintainer_email 'thongsav@usgs.gov'
license          'gplv3'
description      'Installs/Configures CIDA Auth DB/Tomcat stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'
supports         'centos'

depends 'iptables', '~> 2.2.0'
depends 'maven', '~> 2.2.0'
depends 'wsi_tomcat', '>= 0.1.9'
