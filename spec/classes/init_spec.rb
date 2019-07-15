require 'puppetlabs_spec_helper/module_spec_helper'

describe 'sync_ts_server' do
	context 'with default values for all parameters' do
		it { should contain_class('sync_ts_server')}
	end
end

