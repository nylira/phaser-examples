'use strict'
assets = \../../../phaser/examples/assets/
var emitter

g-preload = !->
  g.load.spritesheet \veggies assets+\sprites/fruitnveg32wh37.png 32 32

g-create = !->
  emitter := g.add.emitter g.world.center-x, g.world.center-y, 250
  emitter.make-particles \veggies [0 to 20] 200 true true

  emitter.min-particle-speed.set-to -200 -300
  emitter.max-particle-speed.set-to 200 -400
  emitter.gravity = 150
  emitter.bounce.set-to 0.5 0.5
  emitter.angular-drag = 30

  emitter.start false 8000 400

g-update = !->
  g.physics.collide emitter

g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
