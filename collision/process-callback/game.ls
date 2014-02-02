'use strict'
assets = \../../../phaser/examples/assets/
var sprite1, sprite2

g-preload = !->
  g.load.image \atari assets+\sprites/atari130xe.png
  g.load.image \mushroom assets+\sprites/mushroom2.png

g-create = !->
  g.stage.background-color = \#2d2d2d

  sprite1 := g.add.sprite 0 200 \atari
  sprite1.body.velocity.x = 50 + Math.random! * 100

  sprite2 := g.add.sprite 750 220 \mushroom
  sprite2.body.velocity.x = -(50 + Math.random! * 100)

g-update = !->
  g.physics.collide sprite1, sprite2, collision-callback, process-callback, @

g-render = !->
  g.debug.render-text 'The process-handler will only collide if sprite1 is fastest' 32 32
  g.debug.render-text "sprite1 speed #{sprite1.body.speed}" 32 64
  g.debug.render-text "sprite2 speed #{sprite2.body.speed}" 32 96

collision-callback = (obj1, obj2) ->
  g.stage.background-color = \#992d2d

process-callback = (obj1, obj2) ->
  # This function can perform own additional checks on the two objs that collided.
  # For example you could test for velocity, health, etc.
  # This function needs to return either true or false. If it returns true then collision carries on (separating the two objects).
  # If it returns false the collision is assumed to have failed and aborts, no further checks or separation happens.
  #
  if obj1.body.speed > obj2.body.speed => true
  else false


g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
