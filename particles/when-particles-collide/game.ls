'use strict'
assets = \../../../phaser/examples/assets/
var emitter-left, emitter-right

g-preload = !->
  g.load.image \ball1 assets+\sprites/red_ball.png
  g.load.image \ball2 assets+\sprites/blue_ball.png

g-create = !->
  emitter-left := g.add.emitter 50, g.world.center-y - 200
  emitter-left.bounce.set-to 0.5 0.5
  emitter-left.set-x-speed 100 200
  emitter-left.set-y-speed -50 50
  emitter-left.make-particles \ball1 0 250 1 true

  emitter-right := g.add.emitter g.world.width - 50, g.world.center-y - 200
  emitter-right.bounce.set-to 0.5 0.5
  emitter-right.set-x-speed -100 -200
  emitter-right.set-y-speed -50 50
  emitter-right.make-particles \ball2 0 250 1 true

  emitter-left.start false 5000 20
  emitter-right.start false 5000 20

g-update = !->
  g.physics.collide emitter-left, emitter-right

g-render = !->

g = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
