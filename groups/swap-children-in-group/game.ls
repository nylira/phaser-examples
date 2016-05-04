'use strict'
{map} = require \prelude-ls
var sprite-atari1, sprite-atari2

game-preload = ->
  game.load.image \image-atari1 \../../../phaser/examples/assets/sprites/atari130xe.png
  game.load.image \image-atari2 \../../../phaser/examples/assets/sprites/atari800xl.png

game-create = ->
  sprite-atari1 := game.add.sprite 100 100 \image-atari1
  sprite-atari2 := game.add.sprite 250 90 \image-atari2

  game.input.on-tap.add swap-sprites, @

game-render = ->
  game.debug.render-text 'Tap screen to swap the children (and therefore their indexes)' 10 280

swap-sprites = -> game.world.swap sprite-atari1, sprite-atari2

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: game-preload, create: game-create, render: game-render)
