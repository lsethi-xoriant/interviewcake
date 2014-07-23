/*
 * Solution
 * We swap the first and last characters, then the second and second-to-last characters, and so on until we reach the middle.
*/

var reverse = function (str) {
  // declare pointers at beginning & end
  var left = 0;
  var right = str.length -1;

  // in JS, strings are IMMUTABLE which means you can't change them 
  // an option is to use substr's to move things around, however instead,
  // we'll use .split('') to modify elements and indices
  str = str.split('');

  // for as long as left is < right, swap values
  // this will stop once they meet in the middle
  while (left < right) {
    //swap values by holding the left value before replacing it
    // and reassign right value to temp variable
    var temp    = str[left];
    str[left]   = str[right];
    str[right]  = temp;

    // increment left & decrement right to move pointers accordingly
    left += 1;
    right -= 1;
  }

  // join the array to return a string
  return str.join('');
};

/*
 * Complexity
 * O(n) time and O(1) space.
 */