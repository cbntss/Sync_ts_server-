class sync_ts_server::database (
    String $sync_ts_dbname='sync_ts',
    String $user_password='sync_ts',
    String $username='sync_ts',
) {
    contain postgresql::server

    postgresql::server::db { $sync_ts_dbname:
        user     => $username,
        password => postgresql_password($username, $user_password),
        owner    => $username,
    }

   postgresql_psql { 'schema_sql':
        db       => $sync_ts_dbname,
        unless   => 'SELECT * from dbversion where majorversion = 1 and minorversion = 0',
        command  => file("${module_name}/schema-1.0.sql"),
        require => Postgresql::Server::Db[$sync_ts_dbname],
   }
}
