# Manage the sync_ts_server database

class sync_ts_server::database (
    Boolean $create_database = true,
    String $dbversion_table = 'dbversion',
    Optional[String] $encoding = undef,
    Optional[String] $locale = undef,
    String $schemaname = 'public',
    String $sync_ts_dbname = 'sync_ts',
    String $username = 'sync_ts',
    String $userpass = 'sync_ts',
) {
    if ($create_database == true){
        contain postgresql::server

        postgresql::server::db {$sync_ts_dbname:
            encoding    => $db_encoding,
            locale      => $db_locale,
            owner       => $username,
            password    => postgresql_password($username, $userpass),
            user        => $username,
        }
    }

    postgresql_psql {'schema_sql':
        db      => $sync_ts_dbname,
        unless  => "select * from pg_tables where schemaname = '${schemaname}' and tablename = '${dbversion_table}'",
        command => file("${module_name}/schema-1.0.sql"),
        require => Postgresql::Server::Db[$sync_ts_dbname],
    }
}
