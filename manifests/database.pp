# Manage the sync_ts_server database

class sync_ts_server::database (
    String $dbversion_table = 'dbversion',
    Optional[String] $encoding = undef,
    Optional[String] $locale = undef,
    Boolean $manage_postgres = true,
    String $schemaname = 'public',
    String $sync_ts_dbname = 'sync_ts',
    String $username = 'sync_ts',
    String $userpass = 'sync_ts',
) {
    if ($manage_postgres == true){
        contain postgresql::server
    }else{
        notify {"Not managing postgres.": }
    }

    postgresql::server::db {$sync_ts_dbname:
        encoding    => $encoding,
        locale      => $locale,
        user        => $username,
        password    => postgresql_password($username, $userpass),
        owner       => $username,
    }

    postgresql_psql {'schema_sql':
        db      => $sync_ts_dbname,
        unless  => "select * from pg_tables where schemaname = '${schemaname}' and tablename = '${dbversion_table}'",
        command => file("${module_name}/schema-1.0.sql"),
        require => Postgresql::Server::Db[$sync_ts_dbname],
    }
}
