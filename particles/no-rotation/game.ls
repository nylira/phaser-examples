'use strict'
assets = \../../../phaser/examples/assets/
var emitter

g-preload = !->
  g.load.image \alien assets+\sprites/space-baddie.png

g-create = !->
  g.stage.background-color = \#337799

  emitter := g.add.emitter g.world.center-x, g.world.center-y, 250

  emitter.make-particles \alien

  emitter.min-particle-speed.set-to -300 -300
  emitter.max-particle-speed.set-to 300 300
  
  # By setting the min and max rotation to zero, you disable rotation on
  # the particle completely
  emitter.min-rotation = 0
  emitter.max-rotation = 0

  emitter.start false 4000 15

g-update = !->
g-render = !->

g = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
