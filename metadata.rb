name             'cida-auth'
maintainer       'Ivan Suftin'
maintainer_email 'isuftin@usgs.gov'
license          'gplv3'
description      'Installs/Configures CIDA Auth DB/Tomcat stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.3'
supports         'centos'

issues_url 'https://github.com/USGS-CIDA/cookbook-cida-auth/issues'
source_url 'https://github.com/USGS-CIDA/cookbook-cida-auth'

depends 'iptables'
depends 'maven'
