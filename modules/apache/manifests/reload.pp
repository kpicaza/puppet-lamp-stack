# Install composer
 
class apache::reload {
 
  exec { 'apache reload':
    command => 'sudo service apache2 reload',	
    require => Package['curl', 'php5-cli', 'phpmyadmin', 'php5-intl']
  }
}