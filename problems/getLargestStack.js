/* 
 * Write an extended stack class that has a function getLargest() for returning the largest element in the stack.
 *
 * Gotchas
 * What if we push several items in increasing numeric order (e.g. 1,2,3,4...), so that there is a new largest after each push()? What if we then pop() each of these items off, so that there is a new largest after each pop()? Your algorithm shouldn't pay a steep cost in these edge cases.
 *
 * You should be able to get a runtime of O(1) for push(), pop(), and getLargest().
 */

var Stack = function () {
  this.storage  = {};
  this.size     = 0;
}

Stack.prototype.push = function () {

};

Stack.prototype.peek = function () {

};

Stack.prototype.pop = function () {

};

Stack.prototype.getLargest = function ( ) {

};


























































/*
 * Breakdown
 * One lazy ↴ approach is to have getLargest() simply walk through the stack and find the largest element. 
 * This takes O(n) time for each call to getLargest(), and push() and pop() can be O(1). But we can do better.
 * 
 * To get O(1) time for getLargest(), we could store our largest as a member variable (call it largest). 
 * But how would we keep it up to date?
 * 
 * For every push(), we can check to see if the item being pushed is larger than the current largest, assigning it as our new largest if so. 
 * But what happens when we pop() the current largest? We could re-compute the current largest by walking through our stack in O(n) time. 
 * So our worst-case runtime for pop() would be O(n). We can do better.
 * 
 * What if when we find a new current largest (new_largest), instead of overwriting the old one (old_largest) we held onto it, 
 * so that once new_largest was popped off our stack we would know that our largest was back to old_largest?
 *
 * What data structure should we store our set of "largests" in? 
 * We want something where the last item we put in is the first item we get out ("last in, first out").
 *
 * We can store our list of "largests" in a stack!
 */