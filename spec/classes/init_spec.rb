require 'puppetlabs_spec_helper/module_spec_helper'

describe "sync-ts-server" do
    context 'with ensure => present' do
        let(:params) { {'ensure' => 'present'} }

        it { is_expected.to compile }
  end
end

