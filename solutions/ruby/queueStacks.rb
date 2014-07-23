=begin
  Solution
  Let's call our stacks inStack and outStack.

  For enqueue, we simply push the enqueued item onto inStack.

  For dequeue on an empty outStack, the oldest item is at the bottom of inStack. 
  So we dig to the bottom of inStack by pushing each item one-by-one onto outStack until we reach the bottom item, which we return.

  After moving everything from inStack to outStack, the item that was enqueued the 2nd longest ago (after the item we just returned) 
  is at the top of outStack, the item enqueued 3rd longest ago is just below it, etc. 
  So to dequeue on a non-empty outStack, we simply return the top item from outStack.
=end














=begin
  Complexity
  Each enqueue is clearly O(1) time, and so is each dequeue when outStack has items. 
  Dequeue on an empty outStack is order of the number of items in inStack at that moment, which can vary significantly.

  Notice that the more expensive a dequeue on an empty outStack is (that is, the more items we have to move from inStack to outStack), 
  the more O(1)-time dequeues off of a non-empty outStack it wins us in the future. 
  Once items are moved from inStack to outStack they just sit there, ready to be dequeued in O(1) time. An item never moves "backwards" in our data structure.

  We might guess that this "averages out" so that in a set of m enqueues and dequeues the total cost of all dequeues is actually just O(m). 
  To check this rigorously, we can use the accounting method ↴ , counting the time cost per item instead of per enqueue or dequeue.

  So let's look at the worst case for a single item, which is the case where it is enqueued and then later dequeued. 
  In this case, the item enters inStack (costing 1 push), then later moves to outStack (costing 1 pop and 1 push), 
  then later comes off outStack to get returned (costing 1 pop).

  Each of these 4 pushes and pops is O(1) time. So our total cost per item is O(1). 
  Our m enqueue and dequeue operations put m or fewer items into the system, giving a total runtime of O(m)!
=end