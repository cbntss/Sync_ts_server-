require "spec_helper"
require "pp"

describe 'sync_ts_server' do
	pp "Hello"
	it { should compile}

	it do
	  is_expected.to contain_file('${apache::port_include_dirs}/443.d/sync_ts_server.conf').with(
	    'ensure'     => 'file'
	  )
	end
end

