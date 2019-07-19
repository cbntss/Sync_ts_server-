require 'spec_helper'

describe "apache" do
    let(:params) {
        {
            'default_modules' => ['ssl'],
            'disclaimer' => 'This is a private system provided for authorized uses only. All other access is strictly prohibited.',
            'manage_vhosts' => 'yes',
            'packages' => ['httpd'],
            'ssl_cipher_suites' => 'ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256'
        }
    }

    it { is_expected.to compile }
end

describe "sync_ts_server" do
    let(:params) {
        {
            'packages' => ['pac'],
            'db_password' => '_password_',
            'terminal_url' => 'url',
        }
    }

    it { is_expected.to compile }

    it do
        is_expected.to contain_ini_setting('sync_ts_server::database_username').with(
            ensure:  'present'
        )
    end
end

