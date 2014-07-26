=begin
Solution
We use a bottom-up ↴ algorithm to build up a table ways_of_doing_n_cents such that 
ways_of_doing_n_cents[k] is how many ways we can get to k cents using our denominations. 

We start with the base case that there's one way to create the amount zero, and progressively add each of our denominations.

The number of new ways we can make a higher_amount when we account for a new coin is simply ways_of_doing_n_cents[higher_amount-coin],
where we know that value already includes combinations involving coin (because we went bottom-up, we know smaller values have already been calculated).
=end

def change_possibilities_bottom_up(amount, denominations):
    ways_of_doing_n_cents = [0] * (amount + 1)
    ways_of_doing_n_cents[0] = 1

    for coin in denominations:
      for higher_amount in xrange(coin, amount + 1):
        higher_amount_remainder = higher_amount - coin
        ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount_remainder]

    return ways_of_doing_n_cents[amount]

=begin
Here's how ways_of_doing_n_cents would look in successive iterations of our function for amount=5 and denominations=[1,3,5].

  ===========
  key:
  a = higher_amount
  r = higher_amount_remainder
  ===========

  ============
  for coin = 1:
  ============
  [1, 1, 0, 0, 0, 0]
   r  a

  [1, 1, 1, 0, 0, 0]
      r  a

  [1, 1, 1, 1, 0, 0]
         r  a

  [1, 1, 1, 1, 1, 0]
            r  a

  [1, 1, 1, 1, 1, 1]
               r  a

  ============
  for coin = 3:
  =============
  [1, 1, 1, 2, 1, 1]
   r        a

  [1, 1, 1, 2, 2, 1]
      r        a

  [1, 1, 1, 2, 2, 2]
         r        a

  ============
  for coin = 5:
  =============
  [1, 1, 1, 2, 2, 3]
   r              a

  final answer: 3


  Complexity
  O(n∗m) time and O(n) additional space, where n is the amount of money and m is the number of potential denominations.
=end