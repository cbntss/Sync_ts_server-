require 'spec_helper'

describe 'sync_ts_server' do
	it { is_expected('Sync_ts_server::database_name').to include(
        	:ensure  => 'present',
        	:path    => '/opt/sync_ts_server/config.ini',
        )
     }
end
