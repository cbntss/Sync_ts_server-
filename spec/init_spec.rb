require "spec_helper"

describe 'sync_ts_server' do
    it do
        is_expected.to contain_ini_setting('sync_ts_server::database_username').with(
            ensure:  'present'
        )
    end
end

