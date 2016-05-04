'use strict'
{map} = require \prelude-ls

game-preload = ->
  game.load.image \image-grid \../../../phaser/examples/assets/tests/debug-grid-1920x1920.png
  game.load.image \image-atari1 \../../../phaser/examples/assets/sprites/atari800xl.png

game-create = ->
  game.add.sprite 0 0 \image-grid

  atari1 = game.add.sprite 300 300 \image-atari1
  atari1.input-enabled = true
  # lock-center, bring-to-top, pixel-perfect, alpha-threshold, bounds-rect, bounds-sprite
  atari1.input.enable-drag true
  atari1.input.enable-snap 32 32

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: game-preload, create: game-create)
