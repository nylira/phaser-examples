'use strict'
assets = \../../../phaser/examples/assets/
var emitter

g-preload = !->
  g.load.image \diamond assets+\sprites/diamond.png

g-create = !->
  g.stage.background-color = \#337799

  emitter := g.add.emitter 0 0 200
  emitter.make-particles \diamond
  emitter.gravity = 200

  g.input.on-down.add particle-burst, @

g-update = !->
g-render = !->

particle-burst = ->
  # Position the emitter where the mouse/touch event was
  emitter.x = g.input.x
  emitter.y = g.input.y

  # The first parameter sets the effect to "explode" which means all particles
  # are emitted at once
  # The second gives each particle a 2sec lifespan
  # The third is ignored when using burst/explode mode
  # The final parameter (10) is how many particles will be emitted in this
  # single burst
  #
  emitter.start true 2000 null 10

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
