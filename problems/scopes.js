/* 
 * If we execute this Javascript, what will the browser's console show?
 * 
  var text = 'outside';
  function logIt(){
    console.log(text);
    var text = 'inside';
  };
  logIt();
 * 
 * Gotchas
 * It's not "outside".
 * It's not "inside".
 */

