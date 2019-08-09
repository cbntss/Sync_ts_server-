# Manage the sync_ts_server database

class sync_ts_server::database (
    Boolean $create_database = true,
    Stdlib::Host $db_host = 'localhost',
    String $db_name = 'sync_ts',
    String $db_pass = 'sync_ts',
    String $db_user = 'sync_ts',
    String $dbversion_table = 'dbversion',
    Optional[String] $encoding = undef,
    Optional[String] $locale = undef,
    String $schemaname = 'public',
) {
    if ($create_database == true){
        contain postgresql::server

        postgresql::server::db {$db_name:
            encoding    => $db_encoding,
            locale      => $db_locale,
            owner       => $db_user,
            password    => postgresql_password($db_user, $db_pass),
            user        => $db_user,
            before      => Postgresql_psql['schema_sql'],
        }

        # Use the postgres servers connect_settings
        $connect_settings = $postgresql::server::connect_settings
    }else{
        # Make sure we are not connecting to localhost
        if ($db_host == 'localhost') or ($db_host == '127.0.0.1'){
            fail("If create_database == false then db_host cannot be ${db_host}")
        }

        # Create a connect_settings hash to connect to a remote db.
        $connect_settings = {
            'PGUSER'     => $db_user,
            'PGPASSWORD' => $db_pass,
            'PGHOST'     => $db_host,
            'PGPORT'     => '5432',
            'PGDATABASE' => $db_name,
        }
    }

    postgresql_psql {'schema_sql':
        db                  => $db_name,
        connect_settings    => $connect_settings,
        unless              => "select * from pg_tables where schemaname = '${schemaname}' and tablename = '${dbversion_table}'",
        command             => file("${module_name}/schema-1.0.sql"),
    }
}
