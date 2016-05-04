'use strict'

game = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

function preload
  game.load.image \atari \../../../phaser/examples/assets/sprites/atari130xe.png
  game.load.image \mushroom \../../../phaser/examples/assets/sprites/mushroom2.png

var sprite1
var sprite2

function create
  game.stage.background-color = \#2d2d2d

  sprite1 := game.add.sprite 150 300 \atari
  sprite1.name = \atari
  sprite1.body.immovable = true

  sprite2 := game.add.sprite 700 320 \mushroom
  sprite2.name = \mushroom
  sprite2.body.velocity.x = -100

function update
  # object1, object2, collideCallback, processCallback, callbackContext
  game.physics.collide sprite1, sprite2, collisionHandler, null, @

collisionHandler = (obj1, obj2) ->
  game.stage.background-color = \#992d2d

function render
  game.debug.render-sprite-info sprite1, 32, 32
  game.debug.render-physics-body sprite1.body
  game.debug.render-physics-body sprite2.body
