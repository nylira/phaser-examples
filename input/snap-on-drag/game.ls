'use strict'
#{map} = require \prelude-ls

g-preload = !->
  g.load.image \grid \../../../phaser/examples/assets/tests/debug-grid-1920x1920.png
  g.load.image \atari1 \../../../phaser/examples/assets/sprites/atari130xe.png
  g.load.image \atari2 \../../../phaser/examples/assets/sprites/atari800xl.png

g-create = !->
  g.add.sprite 0 0 \grid

  atari1 = g.add.sprite 128 128 \atari1
  atari2 = g.add.sprite 256 256 \atari2

  atari1.input-enabled = true
  atari2.input-enabled = true

  atari1.input.enable-drag!
  atari2.input.enable-drag!

  atari1.input.enable-snap 32 32 true true
  atari2.input.enable-snap 32 32 false true

g-update = !->

g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
