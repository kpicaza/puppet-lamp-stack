class php::pear {
  include php

  # upgrade PEAR
  #exec { "pear upgrade":
  #    require => Package["php-pear"]
  #}

  # install PHPUnit
  #exec { "pear config-set auto_discover 1":
  #    require => Exec["pear upgrade"]
  #}

  # create pear temp directory for channel-add
  #file { "/tmp/pear/temp":
#    require => Exec["pear config-set auto_discover 1"],
 #   ensure => "directory",
  #  owner => "root",
#    group => "root",
 #   mode => 777
  #}

  # discover channels

 # exec { "pear channel-discover components.ez.no; true":
 #    require => [File["/tmp/pear/temp"], Exec["pear config-set auto_discover 1"]]
 # }
}