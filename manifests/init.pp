# Puppet module for managing sync_ts_server packege
class sync_ts_server (
    Array[String] $packages,
    String $db_password,
    String $terminal_url,
    String $db_username='sync_ts_user',
    String $db_host='localhost',
    String $db_name='sync_ts_server',
) {

    include apache

    # Install required packages
    package {$sync_ts_server::packages:
        ensure => latest,
    }

    # Apache config file
    file{"${apache::port_include_dirs}/443.d/sync_ts_server.conf":
        ensure => file,
        source => 'puppet:///modules/sync_ts_server/sync_ts_server_ssl.conf',
        notify => Service[$apache::service],
    }

     file{"${apache::port_include_dirs}/8443.d/sync_ts_server.conf":
        ensure => file,
        source => 'puppet:///modules/sync_ts_server/sync_ts_server_ssl-verify.conf',
        notify => Service[$apache::service],
    }

    # Build the config.ini file
    ini_setting {'sync_ts_server::database_host':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'host',
        value   => $db_host,
    }

    ini_setting {'sync_ts_server::database_name':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'database',
        value   => $db_name,
    }

    ini_setting {'sync_ts_server::database_username':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'username',
        value   => $db_username,
    }

    ini_setting {'sync_ts_server::database_password':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'password',
        value   => $db_password,
    }

    ini_setting {'sync_ts_server::terminal_url':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'terminalinfo',
        setting => 'url',
        value   => $terminal_url,
    }

    contain sync_ts_server::database

}
