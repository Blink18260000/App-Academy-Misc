Function.prototype.inherits = function(superClass){
  this.prototype.__proto__ = superClass.prototype;
};

function MovingObject () {
  this.superTest = 'Moving Object type';
 };
MovingObject.prototype.meow = function() {console.log("meow?");};
MovingObject.prototype.size = 15;

function Ship () {
  this.test = 'Ship type';
};
Ship.inherits(MovingObject);

Ship.prototype.blastOff = function() { console.log("IGNITION!");};

function Asteroid () {};
Asteroid.inherits(MovingObject);
