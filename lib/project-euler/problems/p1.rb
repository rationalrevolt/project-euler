=begin

If we list all the natural numbers below 10 that are multiples of 3 or
5, we get 3, 5, 6 and 9. The sum of these multiples is 23.  Find the
sum of all the multiples of 3 or 5 below 1000.

=end

module Euler

  class Problem1

    def self.solve limit, solution = 1
      solver = Problem1.new
      case solution
      when 1 then solver.solution1 limit
      when 2 then solver.solution2 limit
      end
    end

    private
    
    # Brute force O(n)
    def solution1 limit
      1.upto(limit - 1).select {|n| n % 3 == 0 or n % 5 == 0}.reduce(:+)
    end

    # Sum of sequence O(1)
    def solution2 limit
      pairs = [3,5,15].map { |n| [n,(limit - 1)/n] }
      sum3, sum5, sum15 = *pairs.map { |n,lim| n * lim * (lim + 1) / 2 }
      sum3 + sum5 - sum15
    end
    
  end

end
