'use strict'
#{map} = require \prelude-ls
var sprite, sprite2

g-preload = !->
  g.load.spritesheet \gameboy \assets/sprites/gameboy_seize_color_40x60.png 40 60

g-create = !->
  g.stage.background-color = \#124184

  sprite := g.add.sprite 200 300 \gameboy 2
  sprite.name = \green
  sprite.anchor.set-to 0.5 0.5
  sprite.body.immovable = true

  sprite2 := g.add.sprite 600 270 \gameboy 3
  sprite2.name = \yellow
  sprite2.body.rebound = false
  sprite2.body.velocity.x = -200

  g.add.tween sprite.scale
  .to(x: 3, y: 3, 2000, Phaser.Easing.Linear.None, true, 0, 1000, true)

g-update = !->
  g.physics.collide sprite, sprite2

g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
