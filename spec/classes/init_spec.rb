require 'puppetlabs_spec_helper/module_spec_helper'

describe 'sync-ts-server' do
    context 'with default values for all parameters' do
	    it { is_expected.to  contain_class('sync-ts-server')}
    end
end

