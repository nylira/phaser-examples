'use strict'
{map} = require \prelude-ls
var game-images

game-preload = ->
  game.load.image \image-atari1 \assets/sprites/atari130xe.png
  game.load.image \image-atari2 \assets/sprites/atari800xl.png
  game.load.image \image-atari4 \assets/sprites/atari800.png
  game.load.image \image-sonic \assets/sprites/sonic_havok_sanity.png
  game.load.image \image-duck \assets/sprites/darkwing_crazy.png
  game.load.image \image-firstaid \assets/sprites/firstaid.png
  game.load.image \image-diamond \assets/sprites/diamond.png
  game.load.image \image-mushroom \assets/sprites/mushroom2.png

game-create = ->
  game-images := game.cache.get-image-keys!

  map ((it) -> add-random-sprite(game-images)), [0 til 20]

add-random-sprite = (sprite-images) ->
  image = game.rnd.pick sprite-images
  sprite = game.add.sprite game.world.random-x, game.world.random-y, image
  sprite.input-enabled = true
  sprite.input.enable-drag false true

game-render = ->
  game.debug.render-input-info 32 32

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: game-preload, create: game-create, render: game-render)
