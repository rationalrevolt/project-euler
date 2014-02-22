# coding: utf-8
=begin

The sum of the squares of the first ten natural numbers is, 1^2 + 2^2 +
... + 10^2 = 385.

The square of the sum of the first ten natural numbers is,(1 + 2 +
... + 10)^2 = 55^2 = 3025 Hence the difference between the sum of the
squares of the first ten natural numbers and the square of the sum is
3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one
hundred natural numbers and the square of the sum.

=end

module Euler

  class Problem6
    def solve
      a = 1.upto(100).reduce(0) { |acc,n| acc + (n ** 2) }
      b = 1.upto(100).reduce(:+) ** 2
      b - a
    end
  end

end
