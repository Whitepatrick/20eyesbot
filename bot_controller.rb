=begin
this file should instruct the bots
what to do and when. will work on
this later
=end

require_relative 'txt_updatr'
require_relative 'followr'
require_relative 'searchr'
require_relative 'streamr'
require_relative 'findr'

swarm = []
fbb = FollowBackBot.new
tfb = TextFileBot.new
sadb = SearchAndDestroyBot.new
ssb = StreamSiteBot.new
fafb = FindAndFollowBot.new

followr = Thread.new { fbb.follow_back }
txt_updatr = Thread.new { tfb.update_with_txt_file(3600) }
searchr = Thread.new { sadb.twitter_search }
streamr = Thread.new { ssb.stream_site }
findr = Thread.new { fafb.find_and_follow }
swarm.push(followr)
swarm.push(txt_updatr)
swarm.push(searchr)
swarm.push(findr)

p "Started at: #{Time.now}"
swarm.each { |t| t.join }
p "Ended at: #{Time.now}"
