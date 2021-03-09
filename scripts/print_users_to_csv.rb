# Author: Greg Schofield (<greg.c.schofield@gmail.com>)
# Description: Prints users collected from ohai via the :Passwd plugin to csv.

require 'csv'

output = CSV.generate do |csv|
  csv << %w(Hostname Username UID GID)
  nodes.all do |n|
    next if n['etc'].nil?

    n['etc']['passwd'].each do |k,v|
      hostname = n['hostname']
      username = k
      uid = v['uid']
      gid = v['gid']
      csv << [hostname, username, uid, gid]
    end
  end
end

puts output
