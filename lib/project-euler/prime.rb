module Euler

  # A Prime Sieve
  class PrimeSieve

    def initialize limit = 1000
      raise ArgumentError, "Positive number expected" unless limit > 0
      
      @limit = limit
      @sieve = Array.new(limit)

      populate_sieve
    end

    def primes
      Enumerator.new do |y|
        sieve.each_with_index do |_, indx|
          y << indx + 1 if sieve[indx]
        end
      end
    end

    def largest
      begin
        indx = sieve.length - 1
        until sieve[indx]
          indx -= 1
        end
        indx + 1
      end
    end

    def prime_count
      primes.to_a.size
    end

    def nth_prime n
      raise ArgumentError, "Expected positive nth"  unless n >= 0
      
      nth = primes.to_a[n]
      until nth
        expand (limit * 2)
        nth = primes.to_a[n]
      end
      nth
    end

    def expand new_limit
      unless new_limit > limit
        raise ArgumentError, "Expected new limit to be greater than current limit"
      end

      known_primes = primes.to_a
      last_known_prime = known_primes.last
      old_limit = limit
      
      increase_limit new_limit

      known_primes.each do |p|
        next if p == 1
        
        start_multiplier = old_limit/p + 1
        mark_multiples_as_non_prime p, start_multiplier
      end
      
      populate_sieve prime_greater_than(last_known_prime)
    end

    def to_s
      "PrimeSieve [limit: #{limit}, primes: #{prime_count}, largest: #{largest}]"
    end

    private

    attr_accessor :limit, :sieve

    def increase_limit new_limit
      self.limit = new_limit
      sieve[limit, new_limit - limit] = nil
    end
    
    def populate_sieve p = 1
      loop do
        mark_prime p
        p = prime_greater_than p
        raise StopIteration unless p
      end 
    end

    def mark_prime n
      sieve[n-1] = true
      mark_multiples_as_non_prime n unless n == 1
    end

    def mark_non_prime n
      sieve[n-1] = false
    end

    def mark_multiples_as_non_prime n, start_multiplier = 2
      multiplier = start_multiplier
      until (value = n * multiplier) > limit
        mark_non_prime value
        multiplier += 1
      end
    end
    
    def prime_greater_than n
      while n < limit && sieve[n] == false
        n += 1
      end 

      n + 1 if n < limit
    end
  end

end
