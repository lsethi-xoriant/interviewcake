=begin
  Solution
  We iterate through our string, making sure that:

  each closer corresponds to the most recently seen, unclosed opener, and
  each opener gets closed by the end.
  We use a stack ↴ to keep track of the most recently seen, unclosed opener.

  So as we iterate:

  If we see an opener, we push it onto the stack.
  If we see a closer, we check to see if it is the closer for the opener at the top of the stack. If it is, we pop from the stack. If it isn't , we return False.
  If we finish iterating and our stack is empty, we know every opener was properly closed.
=end

openers_to_closers_map = {
    '(' : ')',
    '{' : '}',
    '[' : ']'
}

openers = openers_to_closers_map.keys()
closers = openers_to_closers_map.values()

def is_valid(code):
  openers_stack = Stack()
  for char in code:

    if char in openers:
      openers_stack.push(char)  

    elif char in closers:
      last_unclosed_opener = openers_stack.pop()
      # if this closer doesn't correspond to the most recently seen unclosed opener,
      # short-circuit, returning false
      if not openers_to_closers_map[last_unclosed_opener] == char:
        return False

    return openers_stack.is_empty()

=begin
  Complexity
  O(n) time (one iteration through the string), and O(n) space (in the worst case, all of our characters are openers, so we push them all onto the stack).
=end