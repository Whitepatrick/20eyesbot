=begin
this file should instruct the bots
what to do and when. will work on
this later
=end
require_relative 'text_update_bot'
require_relative 'follow_back_bot'
require_relative 'globals'

threads = []
fbb = FollowBackBot.new
tfb = TextFileBot.new

puts "Started at: #{Time.now}"
thread_a = Thread.new { fbb.follow_back }
thread_b = Thread.new { tfb.update_with_txt_file(3600) }
threads.push(thread_a)
threads.push(thread_b)

threads.each { |t| t.join }


threads = []
fart = p "hello" * 1000
poop = p "there" * 500

p "Started at: #{Time.now}"
thread_a = Thread.new { poop }
thread_b = Thread.new { fart }
threads.push(thread_a)
threads.push(thread_b)

threads.each { |t| t.join }
p "Ended at: #{Time.now}"
