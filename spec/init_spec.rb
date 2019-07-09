require 'spec_helper'

describe 'sync_ts_server' do
	it { is_expected.to contain_file('Sync_ts_server::database_name').with_path('/opt/sync_ts_server/config.ini') 
        .with(
        	:ensure  => 'present',
        )
     }
end
