class sync_ts_server::database (
    String $user_password='test',
    String $uaername='test',
) {
    contain postgresql::server

    postgresql::server::db { 'sync_ts':
        user     => $uaername,
        password => postgresql_password($uaername, $user_password),
    }

   # postgresql::server::schema { 'Sync_TS_DB' :
   #     db               = $postgresql::server::db,
   #     owner            = undef,
   #     schema           = "schema-1.0.sql",
   #     connect_settings = $postgresql::server::default_connect_settings,
   # }
}
