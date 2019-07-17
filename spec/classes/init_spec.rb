require 'spec_helper'

describe "sync_ts_server" do

        context 'setting package' do
            let(:params) { {'packages' => 'pac'} }
        end
        context 'setting password' do
             let(:params) { {'db_password' => '_password_'} }
        end
        context 'setting url' do
            let(:params) { {'terminal_url' => 'url'} }
        end


        it { is_expected.to compile }
    it do
        is_expected.to contain_ini_setting('sync_ts_server::database_username').with(
            ensure:  'present'
        )
    end
end

