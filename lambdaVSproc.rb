
def proc_demo_method
  proc_demo = Proc.new { return "Only I print!" }
  proc_demo.call
  "But what about me?" # Never reached
end

puts proc_demo_method 
# Output 
# Only I print!

# (Notice that the proc breaks out of the method when it returns the value.)

def lambda_demo_method
  lambda_demo = lambda { return "Will I print?" }
  lambda_demo.call
  "Sorry - it's me that's printed."
end

puts lambda_demo_method
# Output
# Sorry - it's me that's printed.

# (Notice that the lambda returns back to the method in order to complete it.)

############### ruby collect method ################

first_arr = [3, 4, 5]
second_arr = first_arr.collect { |num| num * 5 }

print second_arr #Output => [15, 20, 25]

# In this example, the .collect method is used to multiply each number within first_arr by 5.
#The outcome is then saved inside of the second_arr variable and printed to the console. The original first_arr is left unchanged

############### proc ################


square = Proc.new { |x| x ** 2 }
# A proc is defined by calling Proc.new followed by a block.

[2, 4, 6].collect!(&square)
# When passing a proc to a method, an & is used to convert the proc into a block.

puts [2, 4, 6].collect!(&square)
# => [4, 16, 36]

########### yield ###############

def yield_test
  puts "I'm inside the method."
  yield
  puts "I'm also inside the method."
end

yield_test { puts ">>> I'm butting into the method!" }
#Output
# I'm inside the method.
# >>> I'm butting into the method.
# I'm also inside the method.

############# passing proc to method #############

# define the proc first
add = Proc.new {|n| n+2}

# passing proc (without &) to method
def tango(add)
  x = [1,2,3,4]
  # now you have to unpack proc using (&)
  x.collect(&add)
end

p tango(add) # [3,4,5,6]