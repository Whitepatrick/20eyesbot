require 'pg'
require 'dbi'
require_relative 'globals'

STATEMENT1 = "CREATE TABLE users (id varchar(40) CONSTRAINT firstkey PRIMARY KEY, name varchar(40) NOT NULL, insert_date date, notes text);"
STATEMENT2 = "SELECT * FROM DEV.users;"

PGconn.new({:host=>"localhost",:user=>"zaphod",:password=>"roll4Cr!t",:dbname=>"zaphod"}) do |conn|
  conn.exec(STATEMENT2)
end
