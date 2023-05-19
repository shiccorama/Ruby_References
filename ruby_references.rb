# With the plus operator:
"Welcome " + "to " + "Odin!"    #=> "Welcome to Odin!"

# With the shovel operator:
"Welcome " << "to " << "Odin!"  #=> "Welcome to Odin!"

# With the concat method:
"Welcome ".concat("to ").concat("Odin!")  #=> "Welcome to Odin!"

\\  #=> Need a backslash in your string?
\b  #=> Backspace
\r  #=> Carriage return, for those of you that love typewriters
\n  #=> Newline. You'll likely use this one the most.
\s  #=> Space
\t  #=> Tab
\"  #=> Double quotation mark
\'  #=> Single quotation mark

"he77o".sub("7", "l")           #=> "hel7o"

"he77o".gsub("7", "l")          #=> "hello"

"hello".insert(-1, " dude")     #=> "hello dude"

"hello world".delete("l")       #=> "heo word"

"!".prepend("hello, ", "world") #=> "hello, world!"

#eql? checks both the value type and the actual value it holds.
5.eql?(5.0) #=> false; although they are the same value, one is an integer and the other is a float
5.eql?(5)   #=> true

#equal? checks whether both values are the exact same object in memory. This can be slightly
 confusing because of the way computers store some values for efficiency. 
 Two variables pointing to the same number will usually return true

 a = 5
b = 5
a.equal?(b) #=> true

This expression is true because of the way computers store integers in memory. 
Although two different variables are holding the number 5,
 they point to the same object in memory. However, consider the next code example:

 a = "hello"
b = "hello"
a.equal?(b) #=> false

This happens because computers can’t store strings in the same efficient way they store numbers.
 Although the values of the variables are the same, the computer has created two separate
  string objects in memory.

  ##This is known as short circuit evaluation.

  if 10 < 2 || 5 < 6 #=> although the left expression is false, there is a party at Kevin's because the right expression returns true
  puts "Party at Kevin's!"
end

# This can also be written as
if 10 < 2 or 5 < 6
  puts "Party at Kevin's!"
end

### case statement or switch cases :

grade = 'F'

did_i_pass = case grade #=> create a variable `did_i_pass` and assign the result of a call to case with the variable grade passed in
  when 'A' then "Hell yeah!"
  when 'D' then "Don't tell your mother."
  else "'YOU SHALL NOT PASS!' -Gandalf"
end


# another case ( without "then " word) :
grade = 'F'

case grade
when 'A'
  puts "You're a genius"
  future_bank_account_balance = 5_000_000
when 'D'
  puts "Better luck next time"
  can_i_retire_soon = false
else
  puts "'YOU SHALL NOT PASS!' -Gandalf"
  fml = true
end

Unless Statements
An unless statement works in the opposite way as an if statement: it only processes the code
 in the block if the expression evaluates to false. There isn’t much more to it.

 age = 19
unless age < 18
  puts "Get a job."
end

## another example :
age = 19
puts "Welcome to a life of debt." unless age < 18

unless age < 18
  puts "Down with that sort of thing."
else
  puts "Careful now!"
end

### Ternary Operator :

age = 19
response = age < 18 ? "You still have your entire life ahead of you." : "You're all grown up."
puts response #=> "You're all grown up."