class symfony2 {

  package { "composer":
    ensure => installed,
  }
 
  exec { "composer install phpunit":
    command => 'composer global require "phpunit/phpunit=4.4.*"',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    path    => '/usr/bin:/usr/local/bin:~/.composer/vendor/bin/',
    require => Exec['install composer']
  }

exec { "composer create-project symfony/framework-standard-edition symfony2 \"2.8.*\"":
    command => 'composer create-project symfony/framework-standard-edition symfony2 "2.8.*"',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    cwd     => '/vagrant/webroot',
    path    => '/usr/bin:/usr/local/bin:~/.composer/vendor/bin/',
    require => Exec['install composer']
  }

}