require 'spec_helper'

describe 'sync_ts_server' do
	it { is_expected.to include('Sync_ts_server::database_name')
        .with(
        	:ensure  => 'present',
        	:path    => '/opt/sync_ts_server/config.ini',
        )
     }
end
