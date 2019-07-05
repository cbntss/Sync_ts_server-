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
        ensure => installed,
        notify => Service[$apache::service],
    }

    # Apache config file
    file{"${apache::port_include_dirs}/433.d/sync_ts_server.conf";
        ensure => file,
        source => 'puppet:///modules/sync_ts_server/sync_ts_server_httpd.conf',
        notify => Service[$apache::service],
    }

    # Build the config.ini file
    ini_settings {'Sync_ts_server::database_host':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'host',
        value   => $db_host,
    }

    ini_settings {'Sync_ts_server::database_name':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'database',
        value   => $db_name,
    }

    ini_settings {'Sync_ts_server::database_username':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'username',
        value   => $db_username,
    }

    ini_settings {'Sync_ts_server::database_password':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'password',
        value   => $db_password,
    }
    
    ini_settings {'Sync_ts_server::terminal_url':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'terminalinfo',
        setting => 'url',
        value   => $terminal_url,
    }
}
