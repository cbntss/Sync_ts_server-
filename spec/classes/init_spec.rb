require 'puppetlabs_spec_helper/module_spec_helper'

describe "sync-ts-server" do
    it do
        it { is_expected.to contain_file('${apache::port_include_dirs}/443.d/sync_ts_server.conf')}
    end
end

