'use strict'
{map} = require \prelude-ls

preload = ->
  g.load.image \ufo \../../../phaser/examples/assets/sprites/ufo.png
  g.load.image \baddie \../../../phaser/examples/assets/sprites/space-baddie.png

create = ->
  group = new monster-group g
  group.create-sprites g, \ufo, \bounce, 32
  group.create-sprites g, \baddie, \slide, 43

  console.log "# of living monsters:", group.count-living!

  player = g.add.sprite 200, 200, \ufo
  player.scale.set-to 2 2
  group.add player

# custom group that creates 30 sprites of the given image
class monster-group extends Phaser.Group
  create-sprites: (game, image, action, count) ->
    for i til count
      @create-sprite ...

  create-sprite: (game, image, action) ->
    sprite = @create game.world.random-x, game.world.random-y, image
    sprite.name = "Peng's Minion!"

    if action == \bounce
      game.add.tween(sprite).to(
        y: sprite.y - 100, 2000, Phaser.Easing.Elastic.Out, true, 0, 1000, true)

    else if action == \slide
      game.add.tween(sprite).to(
        x: sprite.x + 200, 4000, Phaser.Easing.Elastic.Out, true, 0, 1000, true)

g = new Phaser.Game 800, 600, Phaser.AUTO, '', preload: preload, create: create
