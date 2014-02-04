'use strict'
assets = \../../../phaser/examples/assets/

g-preload = !->
g-create = !->
  g.stage.background-color = \#454545

  style = font: '14px Arial', fill: \#ff0044, align: \center

  g.add.text 10 20 g.rnd.integer!
  g.add.text 10 50 g.rnd.frac!
  g.add.text 10 80 g.rnd.real!
  g.add.text 10 110 g.rnd.integer-in-range 100 200

g-update = !->
g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
