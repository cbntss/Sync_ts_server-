class sync_ts_server::database (
    String $sync_ts_dbname='test_two_sync_ts',
    String $user_password='test',
    String $username='testuser',
) {
    contain postgresql::server

    postgresql::server::db { $sync_ts_dbname:
        user     => $username,
        password => postgresql_password($username, $user_password),
        owner    => $username,
    }

   postgresql_psql { 'schema_sql':
        db => $sync_ts_dbname,
        command => file("${module_name}/schema-1.0.sql"),
   }
}
