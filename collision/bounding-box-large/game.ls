'use strict'

g = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

function preload
  g.load.image \atari \../../../phaser/examples/assets/sprites/atari130xe.png
  g.load.image \mushroom \../../../phaser/examples/assets/sprites/mushroom2.png

var sprite1
var sprite2

function create
  g.stage.background-color = \#2d2d2d

  sprite1 := g.add.sprite 130 200 \atari
  sprite1.name = \atari
  sprite1.body.set-rectangle 400 50 -100 20
  sprite1.body.immovable = true

  sprite2 := g.add.sprite 700 220 \mushroom
  sprite2.name = \mushroom
  sprite2.body.velocity.x = -100

function update
  # object1, object2, collideCallback, processCallback, callbackContext
  g.physics.collide sprite1, sprite2, collisionHandler, null, @

collisionHandler = (obj1, obj2) ->
  g.stage.background-color = \#992d2d

  console.log "#{obj1.name} collided with #{obj2.name}"

function render
  g.debug.render-body-info sprite1, 32, 32
  g.debug.render-physics-body sprite1.body
  g.debug.render-physics-body sprite2.body
