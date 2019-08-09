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

    if (isset('postgresql::server::encoding')) and ($encoding == undef){
        # If we don't set encoding but postgresql does, use theirs.
        $db_encoding = $postgresql::server::encoding
    }else{
        # Otherwise use ours (or undef)
        $db_encoding = $encoding
    }

    if (isset('postgresql::server::locale')) and ($locale == undef){
        # If we don't set locale but postgresql does, use theirs.
        $db_locale = $postgresql::server::locale
    }else{
        # Otherwise use ours (or undef)
        $db_locale = $locale
    }

    postgresql::server::db {$sync_ts_dbname:
        encoding    => $db_encoding,
        locale      => $db_locale,
        owner       => $username,
        password    => postgresql_password($username, $userpass),
        user        => $username,
    }

    postgresql_psql {'schema_sql':
        db      => $sync_ts_dbname,
        unless  => "select * from pg_tables where schemaname = '${schemaname}' and tablename = '${dbversion_table}'",
        command => file("${module_name}/schema-1.0.sql"),
        require => Postgresql::Server::Db[$sync_ts_dbname],
    }
}
