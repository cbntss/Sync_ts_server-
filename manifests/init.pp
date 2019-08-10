# Puppet module for managing sync_ts_server packege
class sync_ts_server (
    Array[String] $packages,
    Stdlib::HTTPSUrl $terminal_url,
    Boolean $create_database = true,
    Stdlib::Host $db_host='localhost',
    String $db_name = 'sync_ts',
    String $db_pass = 'sync_ts',
    String $db_user = 'sync_ts',
) {
    # Install required packages
    package {$sync_ts_server::packages:
        ensure => latest,
    }

    contain sync_ts_server::database

    contain sync_ts_server::config

    contain sync_ts_server::apache
}
