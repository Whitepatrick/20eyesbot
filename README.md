# 20eyesbot
[20eyesbot twitter page](https://twitter.com/20eyesBot)

**20eyesbot** is probably annoying  
**20eyesbot** uses the [sferik/twitter](https://github.com/sferik/twitter) gem
**20eyesbot** requires a configuration file called globals.rb (see below)  
**20eyesbot** will probably never be finished but it will have lots of functions!  

## What the bot does:
### txt_updatr:
- Scrapes a URL for all links on it. For my uses I'm typically using
textfiles.com but will probably also update to attrition.org stuff too
- Picks a random text file from the scraped links and starts tweeting out
single lines.
  - weeds out blank lines and lines including bastard operator from hell stuff (very boring :()
- If something bad happens it tweets publically to me
  - begins a tweet cycle that tweets every line and sleeps for a b
- Sleeps for 70 seconds

### searchr:
- searches for a given string and returns a set amount of tweets
- I'll eventually use this to start adding on follower_list

### followr:
- follows every user following @20eyesbot
