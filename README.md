Description
===========
Installs Slanger using rvm and runs it as upstar job.

This cookbook requires [rvm cookbook](https://github.com/fnichol/chef-rvm) and,
since it requires a running Redis server to work properly, you probably also
want to install a Redis cookbook, e.g. [redisio](http://cookbooks.opscode.com/api/v1/cookbooks/redisio).

Requirements
============
This cookbook only supports Ubuntu systems, thought it should work on any of
the rvm cookbook supported OS.

Attributes
==========
The file attributes/default.rb contains the following attribute types:

 * Upstart job specific attributes.
 * Slanger specific attributes, see [Slanger at GitHub](https://github.com/stevegraham/slanger)
   for further information.

Usage
=====
You can include default recipe from your coobooks:

    include_recipe 'slanger'

You can also just add this cookbook to your run list.
