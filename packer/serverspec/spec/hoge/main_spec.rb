require 'spec_helper'

describe command('localectl') do
    its(:stdout) { should contain('LANG=ja_JP.UTF-8') }
end
