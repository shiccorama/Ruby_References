########### CASE IS MORE ACCURATE THAN IF STATEMENT ##########
tv_show = "Bob's Burgers"

case tv_show
  when "Archer"
    puts "I don't like the voice of Archer."
  when "Bob's Burgers"
    puts "I love the voice of Bob Belcher."
  else
    puts "I don't know who voices this cartoon."
end

# => I love the voice of Bob Belcher.

########## RESPOND_TO? ##########
# .respond_to? takes symbol representing method name
# and returns true if the method can be called.
str = "hassam"
p str.next # print "hassan" with N instead of M
# note : str is a string, so you cannot apply .push()
p str.respond_to?(:next) # true
p str.respond_to?(:push) # false

######### ruby short circuit evaluation #########
# ruby check the left-hand-side first, if it's true
# returns true, if it's not, will check the right-hand-side
# and then return the evaluation
a = true
b = false
c = true

puts a || b
#Output => true
puts b || a
#Output => true
puts a && c
#Output => true 
puts a && b
#Output => false

########### ternary ###########
tacos_eaten = 12

puts tacos_eaten >= 5 ? "Sir, you've had enough!" : "Keep eating tacos!"

# => Sir, you've had enough!

######## upto and downto methods ############
"B".upto("F") { |letter| print letter, " " }
# => B C D E F

5.downto(0) { |num| print num, " " }
# => 5 4 3 2 1 0


######### conditional assignment operator ###########
boyfriend = nil

boyfriend ||= "Jimmy Jr."
# it means if boyfriend = nil or undefined, assing "Jimmy Jr." to it

boyfriend ||= "Josh"
# here, boyfriend already assigned as the line above, so, no need for Josh.

puts boyfriend
# => "Jimmy Jr."

### each with index loop #####
def add_value_and_index(array)
  new_array = []
  array.each_with_index do |element, index|
  p "#{element} is a position #{index}"
  new_array << element + index
  end
  new_array
end

p add_value_and_index([10,20,30]) # [10,21,32]

## another way with map function :
def add_value_and_index(array)
  array.map.with_index do |element, index|
  element + index
  end
end
# [10,21,32]