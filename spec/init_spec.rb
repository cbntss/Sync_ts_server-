require 'pp'
require 'spec_helper'

describe 'sync_ts_server' do
    it do
        is_expected.to contain_file('/opt/sync_ts_server/config.ini').with({
            'ensure' => 'present',
        })
    end
end

pp "Hello World"
