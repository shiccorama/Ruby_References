## making new class, taking instace variable and set getter && setter for it:

class Attendee
  def initialize(height)
    # make new instance, set new value from parameter.
    @height = height
  end

  def height
    # setting a getter, when it calls, it returns height
    @height
  end

  def pass_id
    # setting a getter for pass_id, if it's not initialized yet, it will return nil
    @pass_id
  end

  def issue_pass!(pass_id)
    # setting a setter for pass_id, by assign the parameter to it.
    @pass_id = pass_id
  end

  def revoke_pass!
    # reset the pass_id instance variable to nil (setter to nil)
    @pass_id = nil
  end
end


new_attend = Attendee.new(106)
p (new_attend.height)
p (new_attend.pass_id)
p (new_attend.issue_pass!(5))
p (new_attend.revoke_pass!)

###################################
## manipulate strings with multiple methods :

class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    # return only the message without log_level:
    x = @line.split(":")
    x[1].strip
  end

  def log_level
    # return log_level without message and without square brackets [] and downcase :
      y = @line.split(":")
      z = y[0]
      z[1...-1].downcase
  end

  def reformat
    # return this format "invaled operation (error)"
    arr = @line.split(":")
    info = arr[0]
    part2 = info[1...-1].downcase
    msg = arr[1]
    part1 = msg.strip
    newStr = "#{part1} (#{part2})"
    newStr
  end
end

newLine = LogLineParser.new('[ERROR]: Invalid operation')

#######################################
## how to use negate(!) to return true or false :

class Attendee
  def initialize(height)
    @height = height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  # Do not edit above methods, add your own methods below.

  def has_pass?
    # we can check it right away with negate sign !@pass_id, if it's nil, it will return true.
    (@pass_id != nil) ? true : false
  end

  def fits_ride?(ride_minimum_height)
    # since height = 120 in the example, so it should return "true"
    # if we use !(@height >= ride_minimum_height), it should return "false" becasue it's a true statement
    # and we negate the statement with (!)
    (@height >= ride_minimum_height) ? true : false
  end

  def allowed_to_ride?(ride_minimum_height)
    # check if the two methods are true by negate(!)
    !(@pass_id != nil && @height >= ride_minimum_height)
  end
end

x = Attendee.new(120).allowed_to_ride?(100)
p x

############################################
## converting from float to integer and viceversa :

class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if (@speed >= 1 && @speed <= 4)
      rate = (@speed * 221.0).to_f
    elsif (@speed >= 5 && @speed <= 8)
      rate = (@speed * 221.0 * 0.9).to_f
    elsif (@speed == 9)
      rate = (@speed * 221.0 * 0.8).to_f
    elsif (@speed == 10)
      rate = (@speed * 221.0 * 0.77).to_f
    end
  end

  def working_items_per_minute
    if (@speed >= 1 && @speed <= 4)
      rate = (@speed * 221.0 / 60).to_i
    elsif (@speed >= 5 && @speed <= 8)
      rate = (@speed * 221.0 * 0.9  / 60).to_i
    elsif (@speed == 9)
      rate = (@speed * 221.0 * 0.8  / 60).to_i
    elsif (@speed == 10)
      rate = (@speed * 221.0 * 0.77  / 60).to_i
    end
  end

end

x = AssemblyLine.new(6)
p y = x.production_rate_per_hour
p z = x.working_items_per_minute

############################################
## Modules (the father of classes) and loops :
## using self.method/class methods instead of taking objects from class/module:

module SavingsAccount
  def self.interest_rate(balance)
      @balance = balance
      @interest_rate = 0
      if(@balance >= 0 && @balance < 1000)
        @interest_rate = 0.5
      elsif(@balance >= 1000 && @balance < 5000)
        @interest_rate = 1.621
      elsif(@balance >= 5000)
        @interest_rate = 2.475
      elsif(@balance < 0)
        @interest_rate = 3.213
      end
  end

  def self.annual_balance_update(balance)
      @balance = balance
      @balance_update = 0
      if(@balance >= 0 && @balance < 1000)
        @balance_update = (0.5/100 * @balance) + @balance
      elsif(@balance >= 1000 && @balance < 5000)
        @balance_update = (1.621/100 * @balance) + @balance
      elsif(@balance >= 5000)
        @balance_update = (2.475/100 * @balance) + @balance
      elsif(@balance < 0)
        @balance_update = (3.213/100 * @balance) + @balance
      end
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    @current_balance = current_balance
    @desired_balance = desired_balance
    @balance_update = 0
    @counter = 0
    
    while (@current_balance <= @desired_balance)

      if(@current_balance >= 0 && @current_balance < 1000)
        @balance_update = (0.5/100 * @current_balance) + @current_balance
      elsif(@current_balance >= 1000 && @current_balance < 5000)
        @balance_update = (1.621/100 * @current_balance) + @current_balance
      elsif(@current_balance >= 5000)
        @balance_update = (2.475/100 * @current_balance) + @current_balance
      elsif(@current_balance < 0)
        @balance_update = (3.213/100 * @current_balance) + @current_balance
      end
    
      @current_balance = @balance_update
      @counter = @counter + 1
      @counter
      
    end
    @counter
  end

end

##########################################
## Dealing with arrays and Enumeration :
## some array methods :
fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.size      #=> 8
fibonacci.sum       #=> 33
fibonacci.reverse   #=> [13, 8, 5, 3, 2, 1, 1, 0]
fibonacci.count  { |number| number == 1 }   #=> 2
fibonacci.any?   { |number| number == 6 }   #=> false
fibonacci.select { |number| number.odd? }   #=> [1, 1, 3, 5, 13]
fibonacci.all?   { |number| number < 20 }   #=> true
fibonacci.map    { |number| number * 2  }   #=> [0, 2, 2, 4, 6, 10, 16, 26]
fibonacci.none?  { |number| number > 20 }   #=> true
fibonacci.find   { |number| number >= 5}    #=> 5

# Some methods work with or without a block
fibonacci.sum  #=> 33
fibonacci.sum {| number | number * number }  #=> 273

# There are also methods to help with nested arrays:
animals = [ ['cat', 'bob'], ['horse', 'caris'], ['mouse', 'arya'] ]
animals.flatten  #=> ["cat", "bob", "horse", "caris", "mouse", "arya"]

## example :
class BirdCount
  def self.last_week
    @last_week_count = [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @birds_per_day = birds_per_day
  end

  def yesterday
    yesterday_count = @birds_per_day[-2]
  end

  def total
    total_count = @birds_per_day.sum
  end

  def busy_days
    @birds_per_day.count do |num|
      num >= 5
    end
  end

  def day_without_birds?
    @birds_per_day.any?   { |num| num == 0 } 
  end
end

##########################################
## More enumeration methods :
## Enumerating Hashes :
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
pet_names.each { |animal, name| p "#{animal} => #{name}" }
## If you only need one of the values, you can use the special _ symbol to indicate 
## that one value is not needed. This helps both in terms of developer clarity and 
## also is a performance optimisation.
pet_names = {cat: "bob", horse: "caris", mouse: "arya"}
pet_names.each { |_, name| p "=> #{name}" }

## enumeration in nested array with objects :
pets = [
  { animal: "cats", names: ["bob", "fred", "sandra"] },
  { animal: "horses", names: ["caris", "black beard", "speedy"] },
  { animal: "mice", names: ["arya", "jerry"] }
]

p pets.map { |pet|
  pet[:names].select { |name| name.length <= 5}
}.flatten.sort
## ["arya", "bob", "caris", "fred", "jerry" ]


### sorting array ascending and descending :
dogs = [
  { name: "Rover", gender: "Male" },
  { name: "Max", gender: "Male" },
  { name: "Fluffy", gender: "Female" },
  { name: "Cocoa", gender: "Female" }
]

# gender asc, name asc
p(dogs.sort do |a, b|
  [a[:gender], a[:name]] <=> [b[:gender], b[:name]]
end)

# gender desc, name asc
p(dogs.sort do |a, b|
  [b[:gender], a[:name]] <=> [a[:gender], b[:name]]
end)

# gender asc, name desc
p(dogs.sort do |a, b|
  [a[:gender], b[:name]] <=> [b[:gender], a[:name]]
end)

#####################################################################
#### example of using (map, select, find, and each on array of hashes)
#####################################################################

class BoutiqueInventory

  @items = [
  {price: 65.00, name: "Maxi Brown Dress", quantity_by_size: {s: 3, m: 7, l: 8, xl: 4}},
  {price: 50.00, name: "Red Short Skirt", quantity_by_size: {}},
  {price: 29.99, name: "Black Short Skirt", quantity_by_size: {s: 1, xl: 4}},
  {price: 20.00, name: "Bamboo Socks Cats", quantity_by_size: {s: 7, m: 2}}
]

  def initialize(items)
    @items = items
  end

  def item_names
    names = @items.map { |a| a[:name] }
    names.sort { |x,y| x <=> y }
  end

  def cheap
    prices =  @items.select { |a| 
      a[:price] < 30
    }
  end

  def out_of_stock
    no_stock = @items.select { |a| 
      a[:quantity_by_size] == {}
    }
    #  items.select { |i| i[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    @name = name
    matched_name = @items.find { |a| 
      a[:name] == @name
    }
    matched_name[:quantity_by_size]
    #  items.detect { |i| i[:name] == name }.fetch(:quantity_by_size)
  end

  def total_stock
      newArr = []
      quantities = @items.map { |a| a[:quantity_by_size] }
      quantities.each do |item|
        item.each do |k,v|
            newArr << v
        end
      end
      newArr.sum

      #    items.map { |i| i[:quantity_by_size].values.sum }.sum
  end

  private
  attr_reader :items
end

################################################
######## openStruct() #############

# OpenStruct allows you to easily create an object from a Hash. Rather than having to access 
# using Hash keys, OpenStruct instead allows us to use methods to access and set values.

######### what is standard library or STDLIB #########
=begin
All of the classes you've seen in previous exercises have been part of Ruby's Core Library.
OpenStruct is part of Ruby's Standard Library (often shortened to "stdlib") - a collection of classes 
for working with things such as dates, json, and networking. It also provides some useful functionality
for making your code easier to work with.
When using classes that are not from the Core Library — your own code in different files, 
classes from stdlib, or external dependencies — we need to import them using the require method 
before we can use them
visist this link for more info :
https://docs.ruby-lang.org/en/master/OpenStruct.html
=end

require 'ostruct'

attributes = { name: "Jeremy Walker", age: 21, location: "Nomadic" }
person = OpenStruct.new(attributes)

person.name
#=> Jeremy Walker

person.location
#=> Nomadic

# Update the age
person.age = 35

# It sets correctly
person.age
#=> 35

####### example on openStruct.new #############
require "ostruct"

class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    # slicing multiple objects into single object
    @items = items.map { |item| OpenStruct.new(item) }
  end

  def item_names
    # the common solution is commented :
    # items.map { |item| item[:name] }.sort
    # here, we replace the above block with (&:) and attribute name followed
    item_names = items.map(&:name).sort
  end

  def total_stock
    # instead of doing two iterations, we can replace block of codes with (&:)
    # items.sum do |item|
    #   item[:quantity_by_size].values.sum
    # end
    items.map(&:quantity_by_size).map(&:values).sum(&:sum)
  end
end

#################################################
######## composition and decomposition ###########

x, y, z = 1, "Hello", true
p y = "hello"

## Multiple assignment can be used to swap elements in arrays.
## This practice is pretty common in sorting algorithms.

>> numbers = [1, 2]
=> [1, 2]
>> numbers[0], numbers[1] = numbers[1], numbers[0]
=> [2, 1]
>> numbers
=> [2, 1]

## decomposition :

fruits = ["apple", "banana", "cherry"]
x, y, z = fruits
p y = "banana"

## If there are values that are not needed then
## you can use _ to indicate "collected but not used":

fruits = ["apple", "banana", "cherry"]
_, _, z = fruits

## Deep decomposing :

>> fruits_vegetables = [["apple", "banana"], ["carrot", "potato"]]
>> (a, b), (c, d) = fruits_vegetables
>> a
=> "apple"
>> d
=> "potato"

## single and multiple decomposition :

>> fruits_vegetables = [["apple", "banana"], ["carrot", "potato"]]
>> a, (c, d) = fruits_vegetables
>> a
=> ["apple", "banana"]
>> c
=> "carrot"

## if you have assigned variables with incorrect placement :

fruits_vegetables = [["apple", "banana"], ["carrot", "potato"]]
(a, b), (d) = fruits_vegetables

syntax error, unexpected ')', expecting '.' or &. or :: or '['
((a, b), (d)) = fruits_vegetables

## Decomposing an array with the single splat operator (*)

>> fruits = ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]
>> x, *last = fruits
>> x
=> "apple"
>> last
=> ["banana", "cherry", "orange", "kiwi", "melon", "mango"]

## We can also extract the values at the beginning and end of the array
## while grouping all the values in the middle:

>> fruits = ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]
>> x, *middle, y, z = fruits
>> y
=> "melon"
>> middle
=> ["banana", "cherry", "orange", "kiwi"]

## We can also use * in deep decomposition:

>> fruits_vegetables = [["apple", "banana", "melon"], ["carrot", "potato", "tomato"]]
>> (a, *rest), b = fruits_vegetables
>> a
=> "apple"
>> rest
=> ["banana", "melon"]

### Decomposing a Hash :
## Decomposing a hash is a bit different than decomposing an array. To be able to unpack a hash
## you need to convert it to an array first. Otherwise there will be no decomposing:

>> fruits_inventory = {apple: 6, banana: 2, cherry: 3}
>> x, y, z = fruits_inventory
>> x
=> {:apple=>6, :banana=>2, :cherry=>3}
>> y
=> nil

## To coerce a Hash to an array you can use the to_a method:

>> fruits_inventory = {apple: 6, banana: 2, cherry: 3}
>> fruits_inventory.to_a
=> [[:apple, 6], [:banana, 2], [:cherry, 3]]
>> x, y, z = fruits_inventory.to_a
>> x
=> [:apple, 6]

## If you want to unpack the keys then you can use the keys method:

>> fruits_inventory = {apple: 6, banana: 2, cherry: 3}
>> x, y, z = fruits_inventory.keys
>> x
=> :apple

## If you want to unpack the values then you can use the values method:

>> fruits_inventory = {apple: 6, banana: 2, cherry: 3}
>> x, y, z = fruits_inventory.values
>> x
=> 6

## Composition an array with splat operator(*):

>> fruits = ["apple", "banana", "cherry"]
>> more_fruits = ["orange", "kiwi", "melon", "mango"]

# fruits and more_fruits are unpacked and then their elements are packed into combined_fruits
>> combined_fruits = *fruits, *more_fruits

>> combined_fruits
=> ["apple", "banana", "cherry", "orange", "kiwi", "melon", "mango"]

## Composition a hash with double splat operator(**) :

>> fruits_inventory = {apple: 6, banana: 2, cherry: 3}
>> more_fruits_inventory = {orange: 4, kiwi: 1, melon: 2, mango: 3}

# fruits_inventory and more_fruits_inventory are unpacked into key-values pairs and combined.
>> combined_fruits_inventory = {**fruits_inventory, **more_fruits_inventory}

# then the pairs are packed into combined_fruits_inventory
>> combined_fruits_inventory
=> {:apple=>6, :banana=>2, :cherry=>3, :orange=>4, :kiwi=>1, :melon=>2, :mango=>3}

# Usage of splat operator(*) and double splat operator(**) with methods
# Composition with method parameters

# This method is defined to take any number of positional arguments
# (Using the single line form of the definition of a method.)
## (((used with arrays)))

>> def my_method(*arguments)= arguments

# Arguments given to the method are packed into an array

>> my_method(1, 2, 3)
=> [1, 2, 3]

>> my_method("Hello")
=> ["Hello"]

>> my_method(1, 2, 3, "Hello", "Mars")
=> [1, 2, 3, "Hello", "Mars"]

## Usage of **keyword_arguments: (((used with hashes and dictionaries)))

# This method is defined to take any number of keyword arguments

>> def my_method(**keyword_arguments)= keyword_arguments

# Arguments given to the method are packed into a dictionary

>> my_method(a: 1, b: 2, c: 3)
=> {:a => 1, :b => 2, :c => 3}

# If the method defined does not have any defined parameters for keyword 
# arguments(**keyword_arguments or <key_word>: <value>) then the keyword arguments
# will be packed into a hash and assigned to the last parameter.

def methods(kargs)
  puts kargs
end

methods(a:1, b:2, c:3)
## output => {:a=>1, :b=>2, :c=>3}

## *arguments and **keyword_arguments can also be used in combination with one another:

def my_method(*arguments, **keywword_arguments)
  p arguments.sum
  for (key, value) in keyword_arguments.to_a
    p key.to_s + " = " + value.to_s
  end
end

my_method(1, 2, 3, a: 1, b: 2, c: 3)
6
"a = 1"
"b = 2"
"c = 3"

## You can also write arguments before and after *arguments to allow for specific positional arguments.
## This works the same way as decomposing an array.
=begin
Arguments have to be structured in a specific order:
  def my_method(<positional_arguments>, *arguments, <positional_arguments>, <keyword_arguments>, **keyword_arguments)
  end
If you don't follow this order then you will get an error.
=end

def my_method(a, b, *arguments)
  p a
  p b
  p arguments
end

my_method(1, 2, 3, 4, 5)
1
2
[3, 4, 5]

## You can write positional arguments before and after *arguments:
>> def my_method(a, *middle, b)= middle

>> my_method(1, 2, 3, 4, 5)
=> [2, 3, 4]

##  combine positional arguments, *arguments, key-word arguments and **keyword_arguments:

>> def my_method(first, *many, last, a:, **keyword_arguments)
     p first
     p many
     p last
     p a
     p keyword_arguments
     end

>> my_method(1, 2, 3, 4, 5, a: 6, b: 7, c: 8)
1
[2, 3, 4]
5
6
{:b => 7, :c => 8}

## Writing arguments in an incorrect order will result in an error:

def my_method(a:, **keyword_arguments, first, *arguments, last)
  arguments
end

my_method(1, 2, 3, 4, a: 5)

syntax error, unexpected local variable or method, expecting & or '&'
... my_method(a:, **keyword_arguments, first, *arguments, last)

## You can use splat operator (*) to unpack an array of arguments into a method call:
## becareful of the arrangement of arguments :

def my_method(a, b, c)
  p c
  p b
  p a
end

numbers = [1, 2, 3]
my_method(*numbers)
3
2
1

## You can also use double splat operator(**) to unpack a hash of arguments into a method call:
## becareful of the arrangement of arguments :

def my_method(a:, b:, c:)
  p c
  p b
  p a
end

numbers = {a: 1, b: 2, c: 3}
my_method(**numbers)
3
2
1