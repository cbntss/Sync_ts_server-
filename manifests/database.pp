class sync_ts_server::database () {
    class { 'postgresql::server':
    }

    postgresql::server::db { 'sync_ts':
        user     => 'connector',
        password => postgresql_password('connector', 'CzNZnEV8G694'),
    }

    postgresql::server::schema{
        $db               = $postgresql::server::db,
        $owner            = undef,
        $schema           = "schema-1.0.sql",
        $connect_settings = $postgresql::server::default_connect_settings,
    }
}
