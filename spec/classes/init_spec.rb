require 'spec_helper'

describe "sync_ts_server" do
    context 'with ensure => present' do
        let(:params) { {'ensure' => 'present'} }

        it { is_expected.to compile }
  end
end

