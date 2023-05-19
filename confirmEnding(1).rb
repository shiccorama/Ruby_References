def confirmEnding(str, target)

if(str.include? target)
  p "T"
  true
else
  p "F"
  false
end

end


confirmEnding("bastian", "n")


# the above solution is the easest without thinking, but we need to
# find another approach as if we don't have "include?" method.

def confirmEnding(str, target)
	str_arr = str.split("")
  # p str_arr
	target_arr = target.split("")
  # p target_arr
  len_str = str_arr.length
  len_target = target_arr.length

  i = len_str - len_target
	until i == 0 do
		str_arr.shift
    i-=1
	end

  if(str_arr == target_arr)
    p "T"
    true
  else
    p "F"
    false
  end
      
    p target_arr
    p str_arr
end


confirmEnding("Abstraction", "action")