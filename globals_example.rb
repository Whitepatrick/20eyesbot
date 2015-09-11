# globals_example.rb
# This file is to store some global variables that
# will be used across a couple different bot files.
# Also used to help keep linecount down on some bot
# files. Just saying the phrase 'bot files' feels
# gross considering how close it is to 'bot flies'..

# twitter credentials, you should get these from
# the dev.twitter.com page of your twitter acct.
CONSUMER_KEY        = "<-- consumer key goes here -->"
CONSUMER_SECRET     = "<-- consumer secret secret goes here -->"
ACCESS_TOKEN        = "<-- access token secret goes here -->"
ACCESS_TOKEN_SECRET = "<-- access token secret goes here -->"

# this is the URL that the text_file_bot will use
# to get files to tweet out. Using textfiles.com
# because of the layout and files subjects
SCRAPE_URL = "<-- url to scrape goes here -->"

# put your hashtags here, if you don't put any in
# this won't work!!
HASHTAGS = [
  "#sample-hashtag_01",
  "#sample-hashtag_02"
]
