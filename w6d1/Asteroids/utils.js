window.Asteroids = {};
window.Asteroids.Util = {};

window.Asteroids.Util.inherits = function (ChildClass, ParentClass) {
  function Surrogate () {}
  Surrogate.prototype = ParentClass.prototype;
  ChildClass.prototype = new Surrogate();
  ChildClass.prototype.constructor = ChildClass;
};

window.Asteroids.Util.randomVec = function() {
  return [Math.floor(20 * Math.random() - 10),
    Math.floor(20 * Math.random() - 10)];
};
