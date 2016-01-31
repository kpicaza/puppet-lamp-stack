class php {

  # package install list
  $packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "libapache2-mod-php5",
    "php5-intl",
    "php5-curl",
    "php5-imap"
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
