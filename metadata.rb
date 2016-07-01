name             'cida-auth'
maintainer       'Phethala Thongsavanh'
maintainer_email 'thongsav@usgs.gov'
license          'gplv3'
description      'Installs/Configures CIDA Auth DB/Tomcat stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.2'
supports         'centos'

depends 'iptables'
depends 'maven'
depends 'wsi_tomcat'
