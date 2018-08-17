require 'serverspec'
require 'net/ssh'
require 'yaml'

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']
options = Net::SSH::Config.for(host)

options[:user] = ENV['USER']
options[:keys] = ENV['TARGET_SSH_KEY']
options[:auth_methods] = ["publickey"]
options[:host_name] = ENV['TARGET_HOST_IP']
options[:port] = ENV['TARGET_PORT']

set :host,        options[:host_name] || host
set :ssh_options, options

base_spec_dir = Pathname.new(File.join(File.dirname(__FILE__)))

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'