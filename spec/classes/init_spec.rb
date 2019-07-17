require 'spec_helper'

describe "sync_ts_server" do
    it do
        let(:params) { {'packages' => 'pac'} }
        let(:params) { {'db_password' => '_password_'} }
        let(:params) { {'terminal_url' => 'url'} }

        it { is_expected.to compile }
        is_expected.to contain_ini_setting('sync_ts_server::database_username').with(
            ensure:  'present'
        )
    end
end

