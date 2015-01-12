def roll(rollstring)
	if rollstring[rollstring.length-1] == "!"
		@explode = true
		rollstring = rollstring.chop
	else
		@explode = false
	end
	@token = rollstring.split("d")
	@total = 0
	@retval = ""
	
	if @token[1].include? ">"
		temp = @token[1].split(">") 
		@token[1] = temp[0]
		diff = temp[1]
		successes(@token[0].to_i, @token[1].to_i, diff.to_i)
		@retval = @retval.to_s + " Successes: " + @total.to_s
	else
		@token[0].to_i.times do
			adddie(@token[1].to_i)
		end
		@retval = @retval.to_s + " Total: " + @total.to_s
	end
	return @retval
end

def onedie(min,max)
	return(rand(max)+min)
end

def adddie(size)
	singleroll = onedie(1,size)
	@retval = @retval + " " + singleroll.to_s
	if @explode
		if singleroll == size
			adddie(size)
		end
	end
	@total = @total.to_i + singleroll.to_i
end

def successes(num, size, diff)
	num.times do
		singleroll = onedie(1,size)
        	@retval = @retval + " " + singleroll.to_s
        	if @explode
			if singleroll == size
				successes(1, size, diff)
                	end
		end
		@total = @total+1 if singleroll.to_i >= diff
	end
end
