require 'spec_helper'

describe 'sync_ts_server' do
	it do
		is_expected.to contain_class('database_name').with({
        	:ensure  => 'present',
        	:path    => '/opt/sync_ts_server/config.ini',
        	:section => 'database',
        	:setting => 'database',
        	:value   => 'sync_ts',
        })
    end
end
