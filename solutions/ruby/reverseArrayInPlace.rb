=begin
  Solution
  We swap the first and last characters, then the second and second-to-last characters, and so on until we reach the middle.
=end


def reverse(string);
  left_ptr  = 0;
  right_ptr = len(string)-1

  while left_ptr < right_ptr:
    #swap
    temp = str[left_ptr]
    string[left_ptr] = string[right_ptr]
    string[right_ptr] = temp

    #step towards the middle
    left_ptr += 1
    right_ptr -= 1

  return string

=begin
  Complexity
  O(n) time and O(1) space.
=end