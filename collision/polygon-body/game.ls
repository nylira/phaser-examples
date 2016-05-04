'use strict'
var sprite1, sprite2
assets = \../../../phaser/examples/assets/

g-preload = !->
  g.load.image \parsec assets + \sprites/parsec.png
  g.load.image \spaceman assets + \sprites/exocet_spaceman.png

g-create = !->
  g.stage.background-color = \#2d2d2d

  sprite1 := g.add.sprite 550 250 \parsec
  sprite1.name = "Lamborghini"
  sprite1.body.set-polygon 56 -1 10 -5 1 -13 0 -34 55 -60 112 -78 165 -80 214 -74 285 -71 296 -44 298 -12 292 -5 168 -3
  sprite1.body.translate 0 80
  sprite1.body.velocity.x = -100

  sprite2 := g.add.sprite 0 200 \spaceman
  sprite2.name = "Spaceman"
  sprite2.body.set-polygon 34 -172  75 -172  87 -145  121 -52  105 -16  55 -3  9 -19  1 -57  24 -145
  sprite2.body.translate 0 175
  sprite2.body.velocity.x = 100

g-update = !->
  g.physics.collide sprite1, sprite2, collision-handler, null, @

g-render = !->
  g.debug.render-physics-body sprite1.body
  g.debug.render-physics-body sprite2.body

collision-handler = (sprite1, sprite2) ->
  g.stage.background-color = \#992d2d
  console.log "#{sprite1.name} collided with #{sprite2.name}!!onne11"

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
