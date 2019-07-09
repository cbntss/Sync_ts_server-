require 'pp'
require 'spec_helper'

describe 'sync_ts_server' do
    it { is_expected.to contain_ini_settings('Sync_ts_server::database_name') }
end

pp "Hello World"
