# Configure apache for sync_ts_server

class sync_ts_server::apache() {
    assert_private()

    include apache

    # Apache config file for users.
    file{"${apache::port_include_dirs}/443.d/sync_ts_server.conf":
        ensure => file,
        source => 'puppet:///modules/sync_ts_server/sync_ts_server_ssl.conf',
        notify => Service[$apache::service],
    }

    # Apache config file for terminals.
    file{"${apache::port_include_dirs}/8443.d/sync_ts_server.conf":
        ensure => file,
        source => 'puppet:///modules/sync_ts_server/sync_ts_server_ssl-verify.conf',
        notify => Service[$apache::service],
    }
}
