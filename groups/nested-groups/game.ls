'use strict'
{map} = require \prelude-ls
var balls-group, ships-group

preload = ->
  g.load.image \ball \../../../phaser/examples/assets/sprites/pangball.png
  g.load.image \arrow \../../../phaser/examples/assets/sprites/asteroids_ship.png

create = ->
  balls-group := g.add.group!
  ships-group := g.add.group!

  for i til 20
    balls-group.create g.world.random-x, g.world.random-y, \ball
    ships-group.create g.world.random-x, g.world.random-y, \arrow

  balls-group.for-each (sprite) ->
    sprite.anchor.set-to 0.5 0.5 if sprite.body?

  # sup grouping in action!
  balls-group.add ships-group

update = ->
  balls-group.x += 0.8
  ships-group.x += 1.6

  balls-group.for-each (sprite) ->
    if sprite.body?       # make sure we use sprites, not sub-groups
      sprite.rotation += 0.25
      if sprite.body.x >= 832
        sprite.body.x = -32
        sprite.body.y = Math.floor Math.random! * g.world.height

  ships-group.for-each (sprite) ->
    sprite.rotation = 0
    if sprite.body.x >= 812
      sprite.body.x = -12
      sprite.body.y = Math.floor Math.random! * g.world.height

g = new Phaser.Game 800, 600, Phaser.AUTO, '', preload: preload, create: create, update: update
