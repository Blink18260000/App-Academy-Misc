var uniq = function(ary) {
  var potato;
  var ary2 = [];
  for (var i = 0; i < ary.length; i++) {
    potato = false;
    for (var j = 0; j < ary2.length; j++) {
      if (ary[i] === ary2[j]) {
        potato = true;
        break;
      }
    }
    if (!potato) {
      ary2 = ary2.concat(ary[i]);
    }
  }
  return ary2;
};

var twoSum = function(ary) {
  var ary2 = [];
  for (var i = 0; i < ary.length; i++) {
    for (var j = i + 1; j < ary.length; j++) {
      if (ary[i] + ary[j] === 0) {
        ary2.push([i, j]);
      }
    }
  }
  return ary2;
};


var transpose = function(ary) {
  var superAry = [];
  for (var i = 0; i < ary[0].length; i++){
    superAry[i] = [];
  }
  for (i = 0; i < ary.length; i++){
    for (var j = 0; j < ary[0].length; j++){
      superAry[j][i] = ary[i][j];
    }
  }
  return superAry;
};


Array.prototype.each = function(func){
  for (var i = 0; i < this.length; i ++){
    func(this[i]);
  }
};

Array.prototype.map = function(func){
  for (var i = 0; i < this.length; i ++){
    this[i] = func(this[i]);
  }
};


Array.prototype.inject = function(funcBase, accBase){
  var acc = accBase || false;
  var func = funcBase || function(arg){ acc = acc + arg; };
  this.each(func);
  return acc;
};

Array.prototype.bubbleSort = function() {
  var sorted = false;
  while(!sorted) {
    sorted = true;
    for(var i = 0; i < (this.length - 1); i++) {
      if(this[i] > this[i + 1]) {
        var hold = this[i];
        this[i] = this[i + 1];
        this[i + 1] = hold;
        sorted = false;
      }
    }
  }
};

String.prototype.substrings = function() {
  var ssArr = [];
  var c = 0;
  for (var i = 0; i < this.length; i++) {
    for (var j = (i + 1); j <= this.length; j++) {
      ssArr[c++] = this.slice(i,j);
    }
  }
  return ssArr;
};

var exp = function(b, n) {
  if (n === 0) {
    return 1;
  } else if (n === 1) {
    return b;
  } else {
    return exp(b, (n - 1)) * b;
  }
};


var exp2= function(b,n){
  if (n === 0) {
    return 1;
  } else if (n === 1) {
    return b;
  }else{
    if ( n % 2 === 0){
      var num = exp2(b, n/2);
      return num * num;
    }else{
      num = exp2(b, n/2);
      return num * num * b;
    }
  }
};

var fibonacci = function(k) {
  var arr = [];
  var fibonacciHelper = function(n){
    if (n <= 0){
      return 0;
    }else if (n === 1){
      return 1;
    }else if (n === 2){
      return 1;
    }else{
      if (!arr[n - 3]) {
        arr[n - 3] = fibonacciHelper(n - 2);
      }
      if (!arr[n - 2]) {
        arr[n - 2] = fibonacciHelper(n - 1);
      }
      arr[n - 1] = arr[n - 3] + arr[n - 2];
      return arr[n - 1];
      // return [1,1].concat(fibonacci(n - 1)[-1] + fibonacci(n - 1)[-2]);
      // return fibonacci(n - 1) + fibonacci(n - 2);
    }
  };
  fibonacciHelper(k);
  return arr;
};

var bSearch = function(arr,target){
  var pivot = Math.floor(arr.length / 2);

  var left = arr.slice(0, pivot);
  var right = arr.slice(pivot + 1, arr.length);

  if(arr[pivot] === target){
    return pivot;
  }else if (target < arr[pivot]){
    return bSearch(left, target);
  }else{
    return pivot + 1 + bSearch(right, target);
  }
};

function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  console.log(this.owner + " loves " + this.name);
};

Cat.prototype.meow = function() {
  console.log("Meow meow meow");
};















// [].__proto__["each"] = function(fun) {
//
// }

// function Doog(name) {
//   this.name = name;
// }
//
// // Doog.__proto__.potato = function() {
// //
// // }
//
// Doog.prototype.bark = function() {
//   console.log("bark you fucker");
// };
