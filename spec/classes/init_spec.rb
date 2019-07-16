require 'puppetlabs_spec_helper/module_spec_helper'

describe 'sync-ts-server' do
    it  do
        it { is_expected.to  contain_class('sync-ts-server')}
    end
end

