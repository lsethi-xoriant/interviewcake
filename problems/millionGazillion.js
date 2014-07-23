/*
 * I'm making a search engine called MillionGazillion™.
 * I wrote a crawler that visits web pages, stores a few keywords in a database, and follows links to other web pages. 
 *
 * I noticed that my crawler was wasting a lot of time visiting the same pages over and over, 
 * so I made a hash table visited where I'm storing URLs I've already visited. 
 * Now the crawler only visits a URL if it hasn't already been visited.
 *
 * Thing is, the crawler is running on my old desktop computer in my parents' basement (where I totally don't live anymore), 
 * and it keeps running out of memory because visited is getting so huge.
 *
 * How can I trim down the amount of space taken up by visited?
 *
 * Gotchas: 
 * The strategy I came up with doesn't take a hit on runtime.
 *
 * Replacing common substrings like ".com" and "www" with characters that aren't allowed in URLs definitely wins us something, but we can do even better. 
 * How can we even further exploit overlaps or shared prefixes between URLs?
 */





















































































/*
 * Breakdown
 * Notice that a boatload of URLs start with "www."

 * We could make visited a nested hash table where the outer key is the subdomain and the inner key is the rest of the URL, 
 * so for example visited['www.']['google.com'] = True and visited['www.']['interviewcake.com'] = True. 
 * Now instead of storing the "www." for each of these URLs, we've just stored it once in memory. 
 * If we have 1,000 URLs and half of them start with "www." then we've replaced 500∗4 characters with just 4 characters in memory.

 * But we can do even better.
 * What if we used this same approach of separating out shared prefixes recursively? How long should we make the prefixes?
 * What if we made the prefixes just one character?
 */