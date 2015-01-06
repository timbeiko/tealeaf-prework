# proc2.rb 

def do_until_false first_input, some_proc
	input  = first_input
	output = first_input

	while output
		input  = output
		output = some_proc.call input 
	end

	input
end

build_array_of_squares = Proc.new do |array|
	last_number = array.last
	if last_number <= 0
		false 
	else
		# Take off the last number ...
		array.pop
		# ... and replace it with it's square 
		array.push last_number*last_number
		# ... followed bu the next smalelr number 
		array.push last_number-1
	end
end

always_false = Proc.new do |just_ignore_me|
	false
end

puts do_until_false([10], build_array_of_squares).inspect

yum = "lemonade with a hint of coke."
puts do_until_false(yum, always_false)