# Manage the sync_ts_server database

class sync_ts_server::database () {
    assert_private()

    $dbversion_table = 'dbversion',
    String $schemaname = 'public',

    if ($sync_ts_server::create_database == true){
        contain postgresql::server

        postgresql::server::db {$sync_ts_server::db_name:
            owner       => $sync_ts_server::db_user,
            password    => postgresql_password($sync_ts_server::db_user, $sync_ts_server::db_pass),
            user        => $sync_ts_server::db_user,
            before      => Postgresql_psql['schema_sql'],
        }

        # Use the postgres servers connect_settings
        $connect_settings = $postgresql::server::connect_settings
    }else{
        # Make sure we are not connecting to localhost
        if ($sync_ts_server::db_host == 'localhost') or ($sync_ts_server::db_host == '127.0.0.1'){
            fail("If create_database == false then db_host cannot be ${db_host}")
        }

        # Create a connect_settings hash to connect to a remote db.
        $connect_settings = {
            'PGUSER'     => $sync_ts_server::db_user,
            'PGPASSWORD' => $sync_ts_server::db_pass,
            'PGHOST'     => $sync_ts_server::db_host,
            'PGPORT'     => '5432',
            'PGDATABASE' => $sync_ts_server::db_name,
        }
    }

    postgresql_psql {'schema_sql':
        db                  => $sync_ts_server::db_name,
        connect_settings    => $connect_settings,
        unless              => "select * from pg_tables where schemaname = '${schemaname}' and tablename = '${dbversion_table}'",
        command             => file("${module_name}/schema-1.0.sql"),
    }
}
