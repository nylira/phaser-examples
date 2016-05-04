'use strict'
assets = \../../../phaser/examples/assets/
var emitter

g-preload = !->
  g.load.image \carrot assets+\sprites/carrot.png
  g.load.image \star assets+\misc/star_particle.png
  g.load.image \diamond assets+\sprites/diamond.png

g-create = !->
  emitter := g.add.emitter g.world.center-x, 200, 200

  emitter.make-particles <[diamond carrot star]>
  emitter.start false 5000 20

g-update = !->
g-render = !->

g = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
