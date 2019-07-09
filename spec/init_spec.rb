require 'spec_helper'

describe 'sync_ts_server' do
	it do
		is_expected.to contain_class('Sync_ts_server::database_name')
    end
end
