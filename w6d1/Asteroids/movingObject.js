window.Asteroids.MovingObject = function() {
  this.pos = arguments[0]["pos"];
  this.vel = arguments[0]["vel"];
  this.radius = arguments[0]["radius"];
  this.color = arguments[0]["color"];
};

window.Asteroids.MovingObject.prototype.draw = function (ctx) {
   ctx.fillStyle = this.COLOR;
   ctx.beginPath();

   ctx.arc(
     this.pos[0],
     this.pos[1],
     this.RADIUS,
     0,
     2 * Math.PI,
     false
   );

   ctx.fill();
 };

 window.Asteroids.MovingObject.prototype.move = function(){
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];
    if (this.pos[0] > window.Asteroids.Util.dims.dim_x + this.RADIUS) {
      this.pos[0] -= (window.Asteroids.Util.dims.dim_x + 2 * this.RADIUS);
    } else if (this.pos[0] < 0 - this.RADIUS) {
      this.pos[0] += (window.Asteroids.Util.dims.dim_x + 2 * this.RADIUS);
    }
    if (this.pos[1] > window.Asteroids.Util.dims.dim_y + this.RADIUS) {
      this.pos[1] -= (window.Asteroids.Util.dims.dim_y + 2 * this.RADIUS);
    } else if (this.pos[1] < 0 - this.RADIUS) {
      this.pos[1] += (window.Asteroids.Util.dims.dim_y + 2 * this.RADIUS);
    }
 };


//
// ctx = document.getElementsByTagName("canvas")[0].getContext("2d");
// args = { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"};
// c = new Asteroids.MovingObject(args);
// c.render(ctx);
