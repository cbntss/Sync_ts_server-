class sync_ts_server::database (
    String $user_password='test',
    String $username='test',
) {
    contain postgresql::server

    postgresql::server::db { 'sync_ts':
        user     => 'test',
        password => postgresql_password('test', 'test'),
    }

   # postgresql::server::schema { 'Sync_TS_DB' :
   #     db               = $postgresql::server::db,
   #     owner            = undef,
   #     schema           = "schema-1.0.sql",
   #     connect_settings = $postgresql::server::default_connect_settings,
   # }
}
