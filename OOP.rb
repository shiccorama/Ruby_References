class Child
  # class variable/attribute
  @@children = 0

  #constructor method
  def initialize(name, birth_year)
    # instance variable
    @name = name
    @birth_year = birth_year
    @@children +=1
  end

  def self.children_added
    return @@children
  end

end

naomi = Child.new("Naomi", 2006)
bertha = Child.new("Bertha", 2008)

puts Child.children_added # => 2

class Infant < Child

  # attr_reader :name
  attr_writer :birth_year
  attr_accessor :name

  def initialize(name, birth_year)
    super
  end

end

kid = Infant.new("ali", 2010)
p kid.birth_year  # undefined method because it's for write only
p kid.name # ali
kid.name = "sara"  # using accessor to write a new name for ali
p kid.name # sara

##### ruby namespaces - or - ruby modules #####
#To retrieve a constant from the Math module, the scope resolution operator (::), should be used.

puts Math::PI
# => 3.141592653589793

#In this example, Ruby is targetting the PI constant from Math namespace/module

### you can use "require" to get module from outside ###
require 'date'

puts Date.today
# => 2020-04-16
# variables in modules doesn't make much sence since modules do not change.
# ALWAYS Use constants.
############## ruby modules ###########
## ruby modules are the same as classes but :
##### it's impossible to create instance of modules #####
#A Ruby module can be created using the module keyword
# followed by the module name written in CapitalizedCamelCase 
#format finalized with an end.

module MyPizza
  #constant inside this module
  FAVE_TOPPING = "Buffalo Chicken"
end
#In this example, myPizza is a module
### look at this example of module usage in ruby ####
module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
   # Any class that includes a certain module can use those module's methods! 
   # This now is called a Mixin.
  extend Action
   # extend keyword mixes a module's methods at the class level. 
   # This means that class itself can use the methods, as opposed to instances of the class.
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")  # taking instance of Rabbit class
peter.jump # by using (include Action), you can use instances (mixins)
Rabbit.jump # by using (extend Action), you can use the class itself


######### inheritance in ruby ################
class DerivedClass < BaseClass; end 
# if you want to end a Ruby statement without going to a new line,
# you can just type a semicolon.

class DerivedClass < Base
  def some_method
    super(optional args) 
    # When you call super from inside a method, 
    # that tells Ruby to look in the superclass of the current class
    # and find a method with the same name as the one from which super 
    # is called. If it finds it, Ruby will use the superclass' version of
    # the method.
    end
  end
end

# Any given Ruby class can have only one superclass. 
# Use mixins if you want to incorporate data or behavior from several classes into a 
# single class.

###### proc vs lambda ##########

cube = Proc.new { |x| x ** 3 }
[1, 2, 3].collect!(&cube) # [1, 8, 27] 
# the & is needed to transform the Proc to a block.
p cube.call(5) # call procs directly # 125 = 5^^3 = 5*5*5

lambda { |param| block }
multiply = lambda { |x| x * 3 }
y = [1, 2].collect(&multiply) # 3 , 6

#Diff between procs and lambdas:

#a lambda checks the number of arguments passed to it, while a proc does not (This means that a lambda will throw an error if you pass it the wrong number of arguments, whereas a proc will ignore unexpected arguments and assign nil to any that are missing.)
# when a lambda returns, it passes control back to the calling method; when a proc returns, it does so immediately, without going back to the calling method. So: A lambda is just like a proc, only it cares about the number of arguments it gets and it returns to its calling method rather than returning immediately.

### string important methods ####
"Hello".length # 5
"Hello".reverse # “olleH”
"Hello".upcase # “HELLO”
"Hello".downcase # “hello”
"hello".capitalize # “Hello”
"Hello".include? "i" # equals to false because there is no i in Hello
"Hello".gsub!(/e/, "o") # Hollo
"1".to_i # transform string to integer –– 1
"test".to_sym # converts to :test
"test".intern # :test
:test.to_s # converts to "test"
gets.chomp # get user input

## loop iterator ##
i = 0
loop do
  i += 1
  print "I'm currently number #{i}” # a way to have ruby code in a string
  break if i > 5
end

