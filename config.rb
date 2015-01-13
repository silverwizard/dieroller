#!/usr/local/bin/ruby
config = File.new("db.rb", "w")
config.print("require 'mysql'\n")
print "hostname: "
hostname = gets
print "username: "
username = gets
print "password: "
password = gets
print "dbname: "
dbname = gets
config.print("begin\nraise 'DB Error' unless $my = Mysql.connect('" + hostname.strip + "', '" + username.strip + "', '" + password.strip  + "', '" + dbname.strip + "')\n")
config.print("rescue\nprint 'Please double check db settings or contact the administrator'\nend")
