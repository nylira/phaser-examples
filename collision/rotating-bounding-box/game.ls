'use strict'
assets = \../../../phaser/examples/assets/
var sprite1, sprite2

g-preload = !->
  g.load.image \atari assets+\sprites/atari130xe.png
  g.load.image \mushroom assets+\sprites/mushroom2.png

g-create = !->
  g.stage.background-color = \#2d2d2d

  sprite1 := g.add.sprite 130 200 \atari
  sprite1.name = \atari
  sprite1.rotation = 0.6
  sprite1.body.polygon.rotate 0.6
  sprite1.body.immovable = true

  sprite2 := g.add.sprite 700 210 \mushroom
  sprite2.name = \mushroom
  sprite2.body.velocity.x = -100

g-update = !->
  g.physics.collide sprite1, sprite2, collision-callback, null, @

g-render = !->
  g.debug.render-body-info sprite1, 32, 32
  g.debug.render-physics-body sprite1.body
  g.debug.render-physics-body sprite2.body

collision-callback = (obj1, obj2) ->
  g.stage.background-color = \#992d2d

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
