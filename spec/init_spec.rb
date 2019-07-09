require ‘spec_helper’

describe 'sync_ts_server' do
	it { is_expected.to contain_file('Sync_ts_server::database_name')
        .with(
        	:ensure  => 'present',
        	:path    => '/opt/sync_ts_server/config.ini',
        	:section => 'database',
        	:setting => 'database',
        	:value   => 'sync_ts',
        )
     }
end
