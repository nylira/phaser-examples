'use strict'
var sprite1, sprite2, sprite3
assets = \../../../phaser/examples/assets/

g-preload = !->
  g.load.spritesheet \gameboy assets+\sprites/gameboy_seize_color_40x60.png 40 60
  g.load.image \atari assets+\sprites/atari130xe.png

g-create = !->
  g.stage.background-color = \#124184

  # In this example the little Gameboy sprite can pass through the top/bottom
  # of the Atari sprite because it's set to ignore collisions on its
  # top/bottom faces.

  sprite1 := g.add.sprite 300 200 \atari
  sprite1.name = \atari
  sprite1.body.collide-world-bounds = true
  sprite1.body.check-collision.up = false
  sprite1.body.check-collision.down = false
  sprite1.body.immovable = true

  sprite2 := g.add.sprite 350 400 \gameboy 2
  sprite2.name = \gameboy1
  sprite2.body.collide-world-bounds = true
  sprite2.body.bounce.set-to 1 1

  sprite3 := g.add.sprite 1 210 \gameboy 4
  sprite3.name = \gameboy2
  sprite3.body.collide-world-bounds = true
  sprite3.body.bounce.set-to 1 1

  sprite2.body.velocity.y = -200
  sprite3.body.velocity.x = 200

g-update = !->
  g.physics.collide sprite1, sprite2
  g.physics.collide sprite1, sprite3

g-render = !->
  # g.debug.render-body-info sprite1, 16, 24
  g.debug.render-physics-body sprite1.body
  g.debug.render-physics-body sprite2.body
  g.debug.render-physics-body sprite3.body


g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
