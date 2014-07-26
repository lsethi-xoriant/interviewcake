=begin
  Solution
  We simply walk through the the string, starting at our input opening parenthesis position. 
  As we iterate, we keep a count of how many additional "(" we find as open_nested_parens. 
  When we find a ")" we decrement open_nested_parens. 
  If we find a ")" and open_nested_parens is 0, we know that ")" closes our initial "(", so we return its position.
=end

def get_closing_paren(sentence, opening_paren_index):
  open_nested_parens = 0
  position = opening_paren_index + 1
  for char in sentence[position:]:
    if char == '(':
      open_nested_parens += 1
    elif char == ')':
      if open_nested_parens == 0:
        return position
      else:
        open_nested_parens -= 1
    position += 1

  raise Exception("No closing parenthesis :(")

=begin
Complexity
O(n) time, where n is the number of chars in the string. O(1) space.
=end