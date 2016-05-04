'use strict'
assets = \../../../phaser/examples/assets/
var emitter

g-preload = !->
  g.load.spritesheet \rain assets+\sprites/rain.png 17 17

g-create = !->
  emitter := g.add.emitter g.world.center-x, 0, 400
  emitter.width = g.world.width
  #emitter.angle = 30

  emitter.make-particles \rain
  emitter.max-particle-scale = 0.5
  emitter.max-particle-scale = 0.1
  emitter.set-y-speed 300 500
  emitter.set-x-speed -5 5
  emitter.min-rotation = 0
  emitter.max-rotation = 0

  emitter.start false 1600 5 0

g-update = !->
g-render = !->

g = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
