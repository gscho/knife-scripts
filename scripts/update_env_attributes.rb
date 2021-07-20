# Author: Greg Schofield (<greg.c.schofield@gmail.com>)
# Description: Update an attribute across all environments in an organization.
require 'json' unless defined?(JSON)

attribute_json = ARGV[2]
file = File.read(attribute_json)
data_hash = JSON.parse(file)
attribute_level = data_hash.keys.first

environments.all.each do |env|
  next if env.name.eql?('_default')

  env.send(attribute_level).merge!(data_hash[attribute_level])
  env.save
end

exit 0
