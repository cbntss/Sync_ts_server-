require ‘spec_helper’

describe 'sync_ts_server' do
	do
     	is_expected.to contain_file('Sync_ts_server::database_name')
    end
end