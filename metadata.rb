maintainer       "Rafael Durán Castañeda"
maintainer_email "rafadurancastaneda@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures slanger"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
name             'slanger'
supports         'ubuntu'

recipe  'slanger',
        'Installs and configures Slager as upstart job'

# rvm cookbook comes from
# https://github.com/fnichol/chef-rvm
depends 'rvm'

attribute 'slanger/app_key',
  :display_name => 'application key',
  :description  => 'This is the Pusher app key you want to use',
  :default      => 'appkey',
  :required     => 'recommended'

attribute 'slanger/secret',
  :display_name => 'secret key',
  :description  => 'This is your Pusher secret',
  :default      => 'secret',
  :required     => 'recommended'

attribute 'slanger/respawn',
  :display_name => 'upstart respawn',
  :description  => 'Upstart respawn stanza boolean flag',
  :default      => 'true',
  :required     => true
