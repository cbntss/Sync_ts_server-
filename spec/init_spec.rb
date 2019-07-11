require "spec_helper"
require "pp"

describe 'sync_ts_server' do
	pp "Hello"
    it do
        #is_expected.to contain_ini_setting('sync_ts_server::database_username').with(
            #ensure:  'present'
        #)
        is_expected.to contain_class('sync_ts_server')
   end
end

