#!/usr/bin/ruby
require "cgi"
require "./db"
cgi = CGI.new
clause = ""
emptyclause = 0
if cgi.has_key?("user")
	unless cgi.params["user"][0]==""
		clause = " WHERE user='" + cgi.params["user"][0] +"'"
		emptyclause = 1
	end
end
if cgi.has_key?("game")
	unless cgi.params["game"][0]==""
		if emptyclause == 1
			clause = clause + " AND "
		else
			clause = " WHERE "
		end
		clause = clause + "game ='" + cgi.params['game'][0] + "'"
	end
end

print '<html>'
print ' <form action="display.rb" method="post">'
print '	User<input type="text" name="user" />'
print '	Game<input type="text" name="game" />'
print '	<input type="submit" value="Display Rolls" />'
print '	</form>'
print '</html>'


result = $my.query("SELECT * from rolls" + clause)
result.num_rows.times do
	puts result.fetch_row.join("\s") + "<br />"
end
