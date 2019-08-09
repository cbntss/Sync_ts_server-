# Configure the config.ini for sync_ts_server

class sync_ts_server::config() {
    assert_private()

    # Build the config.ini file
    ini_setting {'sync_ts_server::database_host':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'host',
        value   => $sync_ts_server::db_host,
    }

    ini_setting {'sync_ts_server::database_name':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'database',
        value   => $sync_ts_server::db_name,
    }

    ini_setting {'sync_ts_server::database_username':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'username',
        value   => $sync_ts_server::db_user,
    }

    ini_setting {'sync_ts_server::database_password':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'database',
        setting => 'password',
        value   => $sync_ts_server::db_pass,
    }

    ini_setting {'sync_ts_server::terminal_url':
        ensure  => present,
        path    => '/opt/sync_ts_server/config.ini',
        section => 'terminalinfo',
        setting => 'url',
        value   => $sync_ts_server::terminal_url,
    }
}
