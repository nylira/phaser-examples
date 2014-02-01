'use strict'
{map} = require \prelude-ls
var game-images, group-enemies

game-preload = ->
  game.load.image \image-atari1 \../../../phaser/examples/assets/sprites/atari130xe.png
  game.load.image \image-atari2 \../../../phaser/examples/assets/sprites/atari800xl.png
  game.load.image \image-atari4 \../../../phaser/examples/assets/sprites/atari800.png
  game.load.image \image-sonic \../../../phaser/examples/assets/sprites/sonic_havok_sanity.png
  game.load.image \image-duck \../../../phaser/examples/assets/sprites/darkwing_crazy.png
  game.load.image \image-firstaid \../../../phaser/examples/assets/sprites/firstaid.png
  game.load.image \image-diamond \../../../phaser/examples/assets/sprites/diamond.png
  game.load.image \image-mushroom \../../../phaser/examples/assets/sprites/mushroom2.png

game-create = ->
  game-images := game.cache.get-image-keys!

  group-enemies := game.add.group!

  map ((it) -> add-random-sprite(game-images)), [0 til 20]

add-random-sprite = (sprite-images) ->
  image = game.rnd.pick sprite-images
  sprite = group-enemies.create game.world.random-x, game.world.random-y, image
  sprite.input-enabled = true
  sprite.input.enable-drag false true

game-render = ->
  game.debug.render-input-info 32 32

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: game-preload, create: game-create, render: game-render)
