require 'spec_helper'

describe 'sync_ts_server::database_name' do
	it { is_expected.to include(
        	:ensure  => 'present',
        	:path    => '/opt/sync_ts_server/config.ini',
        )
     }
end
