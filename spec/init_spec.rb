require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'sync_ts_server' do
    it do
        #is_expected.to contain_ini_setting('sync_ts_server::database_username').with(
            #ensure:  'present'
        #)
        is_expected.to contain_file('${apache::port_include_dirs}/433.d/sync_ts_server.conf').with(
    		'ensure'     => 'present',
  		)
    end
end

