'use strict'
#{map} = require \prelude-ls
var sprite1, sprite2

g-preload = !->
  g.load.image \wizball \../../../phaser/examples/assets/sprites/wizball.png
  g.load.image \mushroom \../../../phaser/examples/assets/sprites/mushroom2.png

g-create = !->
  g.stage.background-color = \#2d2d2d

  sprite1 := g.add.sprite 130 250 \wizball
  sprite1.body.set-circle 46
  sprite1.body.immovable = true

  sprite2 := g.add.sprite 700 210 \mushroom
  sprite2.name = \mushroom
  sprite2.body.velocity.x = -100

g-update = !->
  g.physics.collide sprite1, sprite2, collision-handler, null, @

g-render = !->
  g.debug.render-body-info sprite2, 32, 32
  g.debug.render-physics-body sprite1.body
  g.debug.render-physics-body sprite2.body

collision-handler = (obj1, obj2) ->
  g.stage.background-color = \#992d2d

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
