require_relative 'searchr'
require 'dbi'
require 'pg'

pg_conn = PG::Connection.new( :dbname => 'DEV')

pg_conn.prepare('statement1', 'insert into tweets (id, user_name, screen_name, tweet_text) values ($1, $2, $3, $4)')
pg_conn.exec_prepared('statement1', [123456789, 'fake_user_name', 'fake_screen_name', "here is my super important very relevant tweet" ])

sleep(1)
pg_conn.exec('SELECT * FROM tweets')
