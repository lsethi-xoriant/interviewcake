=begin
  Solution
  We walk through the array from beginning to end, keeping track of:

  our min_price so far
  our max_profit so far
  For each time, we check to see if:

  we have a new min_price, or
  buying at the current min_price and selling at the current_price would give a new max_profit.
  So we have:
=end

min_price = stockPricesYesterday[0]
max_profit = 0  q
for time in range(len(stockPricesYesterday)):
  current_price = stockPricesYesterday[time]
  min_price = min(min_price, current_price)
  max_profit = max(max_profit, current_price - min_price)
return max_profit

=begin
  Complexity
  O(n) time (we're only looping through the array once) and O(1) space.
=end