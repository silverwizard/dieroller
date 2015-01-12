#!/usr/bin/ruby
require "./db"
require "./die"
require "cgi"
cgi = CGI.new
result = roll(cgi.params["rollstring"][0].to_s)
$my.query("INSERT INTO rolls set result='" + cgi.params["rollstring"][0] + "', roll='" + result.to_s + "', user='" + cgi.params["user"][0] + "', game='" + cgi.params["game"][0] + "'")
puts result
