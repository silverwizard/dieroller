#!/usr/bin/ruby
require "./db"
require "./die"
require "cgi"
cgi = CGI.new
result = roll(cgi.params["rollstring"][0].to_s)
statement = $my.prepare("INSERT INTO rolls (id, roll, result, user, game) VALUES (" + $my.insert_id.to_s + ", '" + cgi.params["rollstring"][0] + "', '" + result.to_s + "', '" + cgi.params["user"][0] + "', '" + cgi.params["game"][0] + "');")
statement.execute
puts result
$my.close
