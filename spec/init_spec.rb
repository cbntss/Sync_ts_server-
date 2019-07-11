require "spec_helper"

describe 'sync_ts_server' do
    #it do
        #is_expected.to contain_ini_setting('sync_ts_server::database_username').with(
            #ensure:  'present'
        #)
        it { is_expected.to contain_class('sync_ts_server') }
   #end
end

