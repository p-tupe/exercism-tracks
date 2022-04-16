local primes = { 2, 3 } -- Kept in memory so future results are quicker, not essential

-- Check is a number is prime or not by
-- dividing it with each number from primes list
local function is_prime(num)
  -- optimization: Apparently using numerical loops is faster than ipairs
  for j = 1, #primes do
    local prime = primes[j]
    -- optimization: Every composite number has a prime factor less than or equal to its square root.
    if (math.sqrt(num) < prime) then return true end

    if (num % prime == 0) then return false end
  end

  return true
end

-- Find the next prime number by
-- iterating from last known prime until another prime is encountered
local function find_next_prime()
  local last_prime = primes[#primes]
  -- optimization: Increment by 2 because no even number is prime beyond 2
  local num = last_prime + 2

  while true do
    if is_prime(num) then
      primes[#primes + 1] = num
      return num
    end
    num = num + 2
  end
end

-- Find nth prime number by
-- Checking if we have n primes cached,
-- If not, resurce until n primes have been calculated
local function find_nth_prime(n)
  if (#primes >= n) then return primes[n] end
  local next_prime = find_next_prime()
  return find_nth_prime(n)
end

return function(n)
  if (n < 1) then error("n must be greater than 1") end
  return find_nth_prime(n)
end
