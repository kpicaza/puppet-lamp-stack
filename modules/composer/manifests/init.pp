# Install composer
 
class composer {
 
  exec { 'install composer':
    command => 'curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer',	
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    require => Package['curl', 'php5-cli', 'phpmyadmin'],
  }
  
  exec { "composer install phpunit":
    command => 'composer global require "phpunit/phpunit=4.4.*"',
    environment => ["COMPOSER_HOME=/usr/local/bin"],
    path    => '/usr/bin:/usr/local/bin:~/.composer/vendor/bin/',
    require => Exec['install composer']
  }
  
  exec { "composer install twig-extension":
    command => 'composer global require twig/twig:~1.0',
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
