'use strict'
assets = \../../../phaser/examples/assets/
var sprite, other-sprite
counter = 0
step = Math.PI * 2 / 360

g-preload = !->
  g.load.image \sprite assets+\sprites/phaser2.png
  g.load.image \other-sprite assets+\sprites/phaser-dude.png

g-create = !->
  sprite := g.add.sprite 0 0 \sprite
  sprite.alpha = 0.5
  sprite.x = g.width / 2 
  sprite.anchor.set-to 0.5 0.5

  other-sprite := g.add.sprite 0 0 \other-sprite
  other-sprite.alpha = 0.5
  other-sprite.x = g.width / 2  + 150
  other-sprite.y = g.width / 2  + 150
  other-sprite.anchor.set-to 0.5 0.5
  other-sprite.body.immovable = true

g-update = !->
  g.physics.collide sprite, other-sprite

  t-step = Math.sin counter
  sprite.y = g.height / 2 + t-step * 30
  sprite.rotation += Phaser.Math.degToRad 0.1 * t-step
  counter += step

g-render = !->
  g.debug.render-sprite-body sprite
  g.debug.render-sprite-collision sprite, 32, 32
  g.debug.render-sprite-body other-sprite

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
