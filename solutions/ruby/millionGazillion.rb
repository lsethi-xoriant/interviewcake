=begin
  Solution
  We can use a trie. If you've never heard of a trie, think of it this way:

  Let's make visited a nested hash map where each map has keys of just one character. 
  So we would store 'google.com' as visited['g']['o']['o']['g']['l']['e']['.']['c']['o']['m']['*'] = True.

  The '*' at the end means 'this is the end of an entry'. 
  Otherwise we wouldn't know what parts of visited are real URLs and which parts are just prefixes. 
  In the example above, 'google.co' is a prefix that we might think is a visited URL if we didn't have some way to mark 'this is the end of an entry.'

  Now when we go to add 'google.com/maps' to visited, we only have to add the characters '/maps', 
  because the 'google.com' prefix is already there. Same with 'google.com/about/jobs'.

  We can visualize this as a tree, where each node is a character. 
  We can even implement it with node objects and edge pointers instead of nested hash maps.


  GO TO: http://i.imgur.com/y5sPl30.png
  A trie containing "donut.net", "dogood.org", "dog.com", "dog.com/about", "dog.com/pug", and "dog.org"

  If you used a bloom filter, that's a great answer too. Especially if you use run-length encoding.
=end




=begin
  Complexity
  How much space does this save? This is about to get MATHEMATICAL.

  How many characters were we storing in our flat hashmap approach? 
  Suppose visited includes all possible URLs of length 5 or fewer characters. 
  Let's ignore non-alphabetical characters to simplify, sticking to the standard 26 English letters in lowercase. 

  There are 265 different possible 5-character URLs (26 options for the first character, times 26 options for the 2nd character, etc),
  and of course 264 different possible 4-character URLs, etc. 
  If we store each 5-character URL as a normal string in memory, we are storing 5 characters per string,
  for a total of 5∗265 characters for all possible 5-character strings (and 4∗264 total characters for all 4-character strings, etc). 
  So for all 1, 2, 3, 4, or 5 character URLs, our total number of characters stored is:
    
    5∗265+4∗264+3∗263+2∗262+1∗261
  
  So for all possible URLs of length n or fewer, our total storage space is:

    n26n+(n−1)26(n−1)+...+1∗261
  
  This is O(n26n).

  How many characters are stored in our trie? 
  The first layer has 26 nodes (and thus 26 characters), one for each possible starting character. 
  On the second layer, each of those 26 nodes has 26 children, for a total of 262 nodes. 
  The fifth layer has 265 nodes. To store all 1, 2, 3, 4, or 5 character URLs our trie will have 5 layers. So the total number of nodes is:

    265+264+263+262+261
  
  So for all URLs of length n or fewer, we have:

    26n+26(n−1)+...+261
  
  This is O(26n). We've shaved off a factor of n.

  Bonus trivia: although the HTTP spec allows for unlimited URL length, in practice many web browsers won't support URLs over 2,000 characters.  
=end