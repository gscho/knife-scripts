# Author: Greg Schofield (<greg.c.schofield@gmail.com>)
# Description: Prints users collected from ohai via the :Passwd plugin.

printf "%-30s %-20s %-12s %-8s\n", "Hostname", "Username", "UID", "GID"

nodes.all do |n|
  next if n['etc'].nil?

  n['etc']['passwd'].each do |k,v|
    hostname = n['hostname']
    username = k
    uid = v['uid']
    gid = v['gid']
    printf "%-30s %-20s %-12s %-8s\n", hostname, username, uid, gid
  end
end
