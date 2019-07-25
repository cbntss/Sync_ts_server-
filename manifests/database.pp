class sync_ts_server::database (
    String $user_password='test',
    String $username='testuser',
) {
    contain postgresql::server

    postgresql::server::db { 'test_sync_ts':
        user     => 'testuser',
        password => postgresql_password('testuser', 'test'),
    }

   postgresql::server::schema { 'sync_ts_schema':
        db               => 'test_sync_ts',
        owner            => 'testuser',
        search_path      => '/opt/sync_ts_server/schema/schema-1.0.sql',
   }
}
