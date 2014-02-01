'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
)

function preload
  game.load.image \atari \assets/sprites/atari130xe.png
  game.load.image \mushroom \assets/sprites/mushroom2.png

var sprite1, sprite2

function create
  game.stage.background-color = \#2d2d2d
  
  sprite1 := game.add.sprite 0 200 \atari
  sprite1.name = \atari
  sprite1.body.velocity.x = 50 + Math.random! * 100
  sprite1.body.custom-separate-x = true

  sprite2 := game.add.sprite 750 220 \mushroom
  sprite2.name = \mushroom
  sprite2.body.velocity.x = -(50 + Math.random! * 100)
  sprite2.body.custom-separate-x = true

function update
  # object1, object2, collideCallback, processCallback, callbackContext
  game.physics.collide sprite1, sprite2, collision-handler, process-handler, @

process-handler = (obj1, obj2) ->
  # This function can perform your own additional checks on the two objects that collided
  # For example, you can test for velocity, health, etc
  # If you want the collision to be deemed successful this function must return true
  # In which case the collision-handler will be called, otherwise it won't.
  #
  # Note: the objects will have already separated by this point unless you have set
  # their customSeparateX/Y flags to true. If you do that it's up to you handle the separation.
  if obj1.body.velocity.x > Math.abs(obj2.body.velocity.x)
    obj2.kill!
    obj1.body.velocity.x = 0
  else
    obj1.kill!
    obj2.body.velocity.x = 0

  return true

collision-handler = (obj1, obj2) ->
  game.stage.background-color = \#992d2d

  console.log "#{obj1.name} collided with #{obj2.name}"
