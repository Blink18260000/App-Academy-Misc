(function () {
  if (typeof Asteroids === "undefined") {
    window.Asteroids = {};
  }

  var Game = window.Asteroids.Game = function (DIM_X, DIM_Y) {
    window.Asteroids.Util.dims = {dim_x : DIM_X, dim_y : DIM_Y};
    // this.DIM_X = DIM_X;
    // this.DIM_Y = DIM_Y;

    this.asteroids = [];
    for (var i = 0; i < Game.NUM_ASTEROIDS; ++i) {
      this.asteroids.push(
        new window.Asteroids.Asteroid(window.Asteroids.Util.randomVec())
      );
    }
  };

  Game.NUM_ASTEROIDS = 5;

  Game.prototype.render = function (ctx) {
    //this will empty the canvas
    ctx.clearRect(0, 0, window.Asteroids.Util.dims.dim_x, window.Asteroids.Util.dims.dim_y);

    this.asteroids.forEach(function (asteroid) {
      asteroid.draw(ctx);
    });
  };

  Game.prototype.moveAsteroids = function () {
    this.asteroids.forEach(function (asteroid) {
      asteroid.move();
    });
  };

  Game.prototype.start = function (canvasEl) {
    // get a 2d canvas drawing context. The canvas API lets us call
    // a `getContext` method on a canvas DOM element.
    var ctx = canvasEl.getContext("2d");

    //this function will update the position of all the asteroids,
    //clear the canvas, and redraw them
    var animateCallback = function(){
      this.moveAsteroids();
      this.render(ctx);
      //this will call our animateCallback again, but only when the browser
      //is ready, usually every 1/60th of a second
      requestAnimationFrame(animateCallback);

      //if we didn't know about requestAnimationFrame, we could use setTimeout
      //setTimeout(animateCallback, 1000/60);
    }.bind(this);

    //this will cause the first render and start the endless triggering of
    //the function using requestAnimationFrame
    animateCallback();
  };
})();
