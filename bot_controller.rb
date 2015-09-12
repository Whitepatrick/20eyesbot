=begin
this file should instruct the bots
what to do and when. will work on
this later
=end

#require_relative 'text_update_bot'
#require_relative 'follow_back_bot'
#require_relative 'search_and_destroy_bot'

swarm = []
fbb = FollowBackBot.new
tfb = TextFileBot.new
sadb = SearchAndDestroyBot.new

puts "Started at: #{Time.now}"
followr = Thread.new { fbb.follow_back }
txt_updatr = Thread.new { tfb.update_with_txt_file(3600) }
searchr = Thread.new { sadb.twitter_search }
swarm.push(followr)
swarm.push(txt_updatr)
swarm.push(searchr)

p "Started at: #{Time.now}"
swarm.each { |t| t.join }
p "Ended at: #{Time.now}"
