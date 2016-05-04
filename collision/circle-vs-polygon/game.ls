'use strict'
#{map} = require \prelude-ls
var sprite1, sprite2, sprite3, sprite4
assets = '../../../phaser/examples/assets/'

g-preload = !->
  g.load.image \parsec assets + \sprites/parsec.png
  g.load.image \wizball assets + \sprites/wizball.png
  g.load.image \spaceman assets + \sprites/exocet_spaceman.png

g-create = !->
  g.stage.background-color = \#2d2d2d

  g.physics.gravity.y = 100

  sprite1 := g.add.sprite 80 200
  sprite1.body.set-polygon 0 0  60 0  100 40  60 80  0 80
  sprite1.body.translate 0 144
  sprite1.body.immovable = true
  sprite1.body.allow-gravity = false

  sprite2 := g.add.sprite 450 300 \parsec
  sprite2.body.set-polygon 56 -1  10 -5  1 -13  0 -34  55 -60  112 -78  165 -80  214 -74  285 -71  296 -44  298 -12  292 -5  168 -3
  sprite2.body.translate 0 80
  sprite2.body.immovable = true
  sprite2.body.allow-gravity = false

  sprite3 := g.add.sprite 230 400 \spaceman
  sprite3.body.set-polygon 34 -172  75 -172  87 -145  121 -52  105 -16  55 -3  9 -19  1 -57  24 -145
  sprite3.body.translate 0 175
  sprite3.body.immovable = true
  sprite3.body.allow-gravity = false

  sprite4 := g.add.sprite 380 100 \wizball
  sprite4.body.set-circle 46
  sprite4.body.collide-world-bounds = true
  sprite4.body.friction = 0
  sprite4.body.bounce.set-to 0.9 0.9
  sprite4.body.velocity.set-to 100 100

g-update = !->
  g.physics.collide-array sprite4, [sprite1, sprite2, sprite3]

g-render = !->
  g.debug.render-body-info sprite4, 32, 32

  g.debug.render-physics-body sprite1.body
  g.debug.render-physics-body sprite2.body
  g.debug.render-physics-body sprite3.body
  g.debug.render-physics-body sprite4.body

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
