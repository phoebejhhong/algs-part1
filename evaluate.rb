load 'stack.rb'
require 'byebug'
# Algorithms, Part I, Week2, Stacks and Queues

# Dijkstra's two-stack algorithm:
# Arithmetic expression evaluation with two stacks,
# one for values, the other for operators
def evaluate_with_two_stacks(string)
  vals = Stack.new
  ops = Stack.new

  string.each_char do |char|
    case char
    when "("
      # do nothing
    when "+"
      ops.push(char)
    when "*"
      ops.push(char)
    when ")"
      op = ops.pop
      case op
      when "+"
        vals.push(vals.pop + vals.pop)
      when "*"
        vals.push(vals.pop * vals.pop)
      end
    else
      vals.push(char.to_i)
    end
  end

  vals.pop
end

# works only with one-digit numbers
puts evaluate_with_two_stacks('(1+((2+3)*(4*5)))')
