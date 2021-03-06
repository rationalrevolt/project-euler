=begin

Problem 2 - Each new term in the Fibonacci sequence is generated by
adding the previous two terms. By starting with 1 and 2, the first 10
terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not
exceed four million, find the sum of the even-valued terms.

=end

module Euler

  class Problem2

    def self.solve limit
      solver = Problem2.new
      solver.fibs(limit).select(&:even?).reduce(:+)
    end

    private
    
    def fibs limit
      [1,2].tap do |fibs|
        a,b = fibs
        sum = a + b
        while sum <= limit
          fibs << sum
          a,b = b,sum
          sum = a + b
        end 
      end
    end
    
  end

end
