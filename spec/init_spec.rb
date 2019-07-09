require 'pp'
require 'spec_helper'

describe 'sync_ts_server' do
    it do
	    is_expected.to contain_ini_setting('Sync_ts_server::database_name').with(
	      ensure:  'present'
	    )
	end
end

