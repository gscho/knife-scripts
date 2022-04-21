# Author: Greg Schofield (<greg.c.schofield@gmail.com>)
# Description: Prints all nodes using a given cookbook to csv.

require 'csv'

cookbook_name = ARGV[2]
output = CSV.generate do |csv|
  csv << %w(node environment cookbook)
  nodes.all do |n|
    n.run_list.run_list_items.each do |item|
      csv << [n.name, n.environment, cookbook_name]
    end
  end
end

puts output
exit 0