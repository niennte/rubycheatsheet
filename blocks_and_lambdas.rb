def separator
  puts '- - - method' 
end

def separator_b
  puts '  * - - block'
end

def separator_l
  puts '  ** - - lambda'
end

def separator_e
  puts '    ! - rescued exception'
end

# using Object#yield
my_object = Object.new
puts my_object.inspect

def my_object.some_method(these, are, arguments)
  separator
  puts these
  puts are
  puts arguments
  puts yield
end

my_object.some_method('these', 'are', 'arguments') do 
  separator_b
  'hi from the block'
end

# sample of native method calls
[1, 2, 3].each do |number|
  separator_b
  puts number
end

[1, 2, 3].each { |number| separator_b; puts number }

# using Proc#call
def my_object.some_method(these, are, arguments, &block)
  separator
  puts these
  puts are
  puts arguments
  puts block.call
end

my_object.some_method('these', 'are', 'arguments') do 
  separator_b
  'hi from the block'
end

def my_object.inspect_block(&block)
 separator
 puts block.inspect
end

my_object.inspect_block do
  separator_b
  puts 'foo'
end

# using Proc#call with arguments
def my_object.call_with_foo_bar(&block)
  separator
  block.call "foo", "bar"
end

my_object.call_with_foo_bar do |block_arg1, block_arg2|
  separator_b
  puts block_arg1.capitalize
  puts block_arg2.upcase
end

# using Object#yield with arguments
def my_object.yield_foo_bar
  separator
  yield "foo", "bar"
end

my_object.yield_foo_bar do |block_arg1, block_arg2|
  separator_b
  puts block_arg1.capitalize
  puts block_arg2.upcase
end

# Procs more relaxed than methods
# Proc.call forgives mismatched number of arguments
my_object.call_with_foo_bar do |block_arg1|
  separator_b
  puts block_arg1.capitalize
end

# Object#yield also forgives mismatched num arg
my_object.yield_foo_bar do |block_arg1|
  separator_b
  puts block_arg1.capitalize
end

# Procs can be instantiated, saved to vars, and called in main scope
my_proc = Proc.new { |block_arg1| separator_b; puts block_arg1.upcase }
my_proc.call 'foo'

# Feeding stand-alone procs into methods
my_object.yield_foo_bar(&my_proc)
my_object.call_with_foo_bar(&my_proc)

# methods do not forgive num arg mismatch
begin
  my_object.some_method('wrong', 'arguments')
rescue ArgumentError => e
  separator_e
  puts e.class.to_s + ': ' + e.to_s
end

# lambda is an unforgiving proc
# lambda acts like method that is not attached to an object
# similar to anonimous function
my_lambda = lambda { |single_arg| puts separator_l; puts single_arg.capitalize }
my_lambda.call('foo')

begin
  my_lambda.call('foo', 'bar')
rescue ArgumentError => e
  separator_e
  puts e.to_s
end

# Returning from methods, blocks, and lambdas
def my_object.method_with_early_return
  separator
  puts 'foo'
  return 'foo'
  puts 'bar'
  'bar'
end 

my_object.method_with_early_return

def my_object.puts_yield
  separator
  puts yield
end

a_proc_with_early_return = Proc.new do
  separator_b
  puts 'in-block foo'
  next 'next foo'
  puts 'final foo'
end

my_object.puts_yield &a_proc_with_early_return

a_lambda_with_early_return = -> do
  separator_l
  puts 'in-lambda bar'
  return 'returned bar'
  puts 'final bar'
end

my_object.puts_yield &a_lambda_with_early_return


puts '- - - - -'
puts "Because Ruby doesn't have native functions, blocks do the heavy lifting of functional operations like iterating over arrays or passing custom code to an object to be run at a later date"


