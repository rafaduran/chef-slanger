#
# Cookbook Name:: slanger
# Attributes:: default
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

# Install conf
default[:slanger][:home_dir] = '/var/lib/slanger'

# Keys
default[:slanger][:app_key] = 'appkey'
default[:slanger][:secret] = 'secret'

# Upstart conf
default[:slanger][:respawn] = true
