# coding: utf-8
=begin

A palindromic number reads the same both ways. The largest palindrome
made from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit
numbers.

=end

module Euler
  
  class Problem4

  def self.solve
    new.solve
  end

  def solve
    products(100,999).sort.reverse.each {|n| return n if palindrome? n }
  end
  
  private

  def products min, max
    min.upto(max).map do |n1|
      n1.upto(max).map do |n2|
        n1 * n2
      end
    end.flatten
  end
  
  module NumberPalindrome

    def palindrome? n
      left,_,right = palindrome_split n
      left == right
    end

    def palindrome_split n
      dc = digit_count n
      left = middle = right = nil
      
      if dc.even?
        left = n / 10 ** (dc/2)
        middle = nil
        right = n % 10 ** (dc/2)
      else
        left = n / 10 ** (dc/2 + 1)
        middle = (n / 10 ** (dc/2)) % 10
        right = n % 10 ** (dc/2)
      end

      right = begin
        r = right
        v = 0
        cnt = dc / 2
        while cnt > 0
          v *= 10
          v += r % 10
          r /= 10
          cnt -= 1
        end
        v
      end

      [left,middle,right]
    end

    def digit_count n
      divisor = 10
      cnt = 1
      while n / divisor > 0
        cnt += 1
        n /= divisor
      end
      cnt
    end
    
  end

  include NumberPalindrome
  
  end

end
