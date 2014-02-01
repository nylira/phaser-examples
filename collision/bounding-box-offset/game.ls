'use strict'

game = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

function preload
  game.load.image \atari \../../../phaser/examples/assets/atari130xe.png
  game.load.image \mushroom \../../../phaser/examples/assets/mushroom2.png

var sprite1
var sprite2

function create
  game.stage.background-color = \#2d2d2d

  sprite1 := game.add.sprite 50 200 \atari
  sprite1.name = \atari
  sprite1.body.velocity.x = 100

  # this adjusts the collision size
  # 100x100 is the new width/height
  # see the offset bounding box for another example
  sprite1.body.set-size 100 50 50 25

  sprite2 := game.add.sprite 700 220 \mushroom
  sprite2.name = \mushroom
  sprite2.body.velocity.x = -100

function update
  # object1, object2, collideCallback, processCallback, callbackContext
  game.physics.collide sprite1, sprite2, collisionHandler, null, @

collisionHandler = (obj1, obj2) ->
  game.stage.background-color = \#992d2d

  console.log "#obj1.name collided with #obj2.name"

function render
  game.debug.render-rectangle sprite1.body
  game.debug.render-rectangle sprite2.body
