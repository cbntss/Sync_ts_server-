require "spec_helper"
require "pp"

describe 'sync_ts_server', :type => :class do
	pp "Hello"
	it { is_expected.to contain_class('sync_ts_server') }
end

