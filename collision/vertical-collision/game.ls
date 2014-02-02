'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

function preload
  game.load.image \atari \../../../phaser/examples/assets/sprites/atari130xe.png
  game.load.image \mushroom \../../../phaser/examples/assets/sprites/mushroom2.png

var sprite1, sprite2

function create
  game.stage.background-color = \#2d2d2d

  sprite1 := game.add.sprite 300 50 \atari
  sprite1.name = \atari
  sprite1.body.velocity.y = 100
  sprite1.body.set-rectangle 220 10 0 0

  sprite2 := game.add.sprite 400, 450, \mushroom
  sprite2.name = \mushroom
  sprite2.body.immovable = true

function update
  game.physics.collide sprite1, sprite2, collision-handler, null, @

collision-handler = ->
  game.stage.background-color = \#992d2d

function render
  game.debug.render-sprite-info sprite1, 32, 32

  game.debug.render-physics-body sprite1.body
  game.debug.render-physics-body sprite2.body
