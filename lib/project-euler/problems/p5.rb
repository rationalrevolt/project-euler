=begin 

2520 is the smallest number that can be divided by each of the
numbers from 1 to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all
of the numbers from 1 to 20?  

Algorithm
---------
Let M = Map of prime factors to their occurance in a number
For each number N starting from 2
  For each factor F
    If M(F) < FactorCount(N,F) store this new factor count into M for F
  End
End
Let Result R be 1
For each factor F in M
  Multiply R by F^M(F)
End
Return R * 2

=end

require "project-euler/prime"

module Euler

  class Problem5
    SIEVE = PrimeSieve.new
    
    class PrimeFactors

      attr_reader :value

      def initialize n
        @value = n
        @factor_map = Hash.new

        compute_factors
      end

      def factors
        factor_map.keys
      end

      def [] p
        factor_map[p]
      end

      private

      attr_reader :factor_map

      def compute_factors
        SIEVE.primes.each do |p|
          next if p == 1
          
          cnt = 0
          num = value
          while num % p == 0
            num /= p
            cnt += 1
          end

          factor_map[p] = cnt if cnt > 0

          break if num == 1
        end
      end
    end

    def self.solve inp
      SIEVE.expand(inp) if SIEVE.largest < inp
      
      factors = Hash.new
      numbers = 2.upto(inp).map { |n| PrimeFactors.new(n) }

      numbers.each do |n|
        n.factors.each do |f|
          if factors[f].nil? or factors[f] < n[f]
            factors[f] = n[f]
          end
        end
      end

      factors.keys.reduce(1) do |acc,f|
        puts "Max count for prime #{f} = #{factors[f]}"
        acc * (f ** factors[f])
      end
    end

  end

end


