#
# Cookbook Name:: slanger
# Recipe:: default
#
# Copyright 2012, Rafael Durán Castañeda
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# A user for running the service
user 'slanger' do
  comment     'slanger system user'
  system      true
  shell       '/bin/false'
  home        node[:slanger][:home_dir]
  manage_home true
end

# Custom Ruby and gems for our user
node['rvm']['user_installs'] = [
  { 'user'            => 'slanger',
    'home'            => node[:slanger][:home_dir],
    'upgrade'         => 'head',
    'default_ruby'    => 'ruby-1.9.3-p194',
    'rvm_gem_options' => '',
    'global_gems'     => [
      { 'name'    => 'slanger'},
    ]
  },
]

include_recipe 'rvm::user'

# An upstart job for running slanger
template  '/etc/init/slanger.conf' do
  source  'etc/init/slanger.conf.erb'
  mode    '0644'
  owner   'root'
  group   'root'
  variables({
    :verbose => '-v',
  })
  notifies :restart, 'service[slanger]'
end

service 'slanger' do
  provider  Chef::Provider::Service::Upstart
  supports  :status => true
  action    [ :enable, :start ]
end
