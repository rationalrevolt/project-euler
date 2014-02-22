=begin

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

=end

require "project-euler/prime"

module Euler

  class Problem3

    def self.largest_prime_factor n
      largest_pf = 1
      sieve_size = 50

      sieve = PrimeSieve.new sieve_size
      
      loop do
        primes = sieve.primes
        prime_factors = primes.select { |p| p > largest_pf && n % p == 0 }

        prime_factors.each do |pf|
          largest_pf = pf
          n /= pf while n % pf == 0
        end

        raise StopIteration if n == 1

        sieve_size *= 2
        sieve.expand sieve_size
      end

      largest_pf
    end

    def self.nth_prime n
      PrimeSieve.new.nth_prime n
    end

    def self.sum_of_primes limit
      PrimeSieve.new(limit).primes.reduce(:+) - 1
    end
    
  end
  
end
