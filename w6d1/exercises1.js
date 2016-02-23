var sum = function () {
  var totalSum = 0;
  for (var i = 0; i < arguments.length; i++) {
    totalSum += arguments[i];
  }
  return totalSum;
};

Function.prototype.myBind = function() {
  var argsList = [].slice.apply(arguments, [1]);
  var fn = this;
  var arg1 = arguments[0];
  return function (){
    var argsList2 = [].slice.apply(arguments);
    argsList = argsList.concat(argsList2);
    fn.apply(arg1, argsList);
  };
};

function Cat(name) {
  this.name = name;
}

Cat.prototype.says = function (sound, person) {
  console.log(this.name + " says " + sound + " to " + person + "!");
  return true;
};

var markov = new Cat("Markov");
var breakfast = new Cat("Breakfast");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true

markov.says.myBind(breakfast)("meow", "a tree");
// Breakfast says meow to a tree!
// true

markov.says.myBind(breakfast, "meow")("Markov");
// Breakfast says meow to Markov!
// true

var notMarkovSays = markov.says.myBind(breakfast);
notMarkovSays("meow", "me");
// Breakfast says meow to me!
// true

var curriedSum = function(numArgs) {
  var nums = [];
  var _curriedSum = function(curNum) {
    nums.push(curNum);
    if (nums.length === numArgs) {
      return nums.reduce(function(prevVal, curVal, curInd, arr) { return prevVal + curVal; } , 0);
    } else {
      return _curriedSum;
    }
  };
  return _curriedSum;
};





























console.log("fuck off atom");
