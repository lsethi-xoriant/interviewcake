=begin
Solution
Let's define a new stack as a member variable and call it largestsStack. 
Whenever we push(), we also push() onto largestsStack if the item is greater than or equal to the current top of largestsStack. 
When we pop(), we also pop() from the top of largestsStack if the items are equal. getLargest() simply returns the top item in largestsStack.
=end

Class maxStack();
  largestStack = Stack();
  stack = Stack();

  def push(item):
    stack.push(item)
    if item >= largestStack.peek():
      largestStack.push(item)

  def pop():
    item = stack.pop()
    if item == largestStack.peek():
      largest.pop()
    return item

  def getLargest()
    return largestStack.peek()

=begin
  Complexity
  O(1) time for push(), pop(), and getMax(). O(m) additional space, where m is the number of operations performed on the stack.

  Notice that our time-efficient approach takes some additional space, 
  while a lazy ↴ approach (simply walking through the stack to find the largest whenever getLargest() is called) took no additional space. 
  We've traded some space efficiency for time efficiency.
=end