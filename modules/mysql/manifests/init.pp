class mysql {

  # root mysql password
  $mysqlpw = "d3v0p5"

  $packages = [
    "mysql-server",
    "phpmyadmin"
  ]

  # install mysql server
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }

  #start mysql service
  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

  # set mysql password
  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysqlpw status",
    command => "mysqladmin -uroot password $mysqlpw",
    require => Service["mysql"],
  }
  
    # Enable access via /phpmyadmin
  # This assumes apache is installed somewhere else in the Puppet manifests
  file { '/etc/apache2/sites-enabled/phpmyadmin':
    ensure  => 'present',
    content => 'include /etc/phpmyadmin/apache.conf',
    mode    =>  644,
    require => [
      Package['phpmyadmin']
    ]   
  }

}
