window.Asteroids.Asteroid = function (pos){
  this.vel = window.Asteroids.Util.randomVec();
  // this.vel = [0,0];
  this.COLOR = "#00FF00";
  this.RADIUS = 50;
  this.pos = [100,100];

};

window.Asteroids.Util.inherits(window.Asteroids.Asteroid,
  window.Asteroids.MovingObject);
