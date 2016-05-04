'use strict'
assets = \../../../phaser/examples/assets/

rect = new Phaser.Rectangle 100 100 100 100
circle = new Phaser.Circle 280 150 100
point = new Phaser.Point 100 280

g-preload = !->
g-create = !->
g-update = !->

g-render = !->
  g.debug.render-rectangle rect, \#ff0000
  g.debug.render-circle circle, \#ffff00
  g.debug.render-point point, \#ffffff
  g.debug.render-pixel 200 280 \#00ffff
  g.debug.render-text "This is debug text" 100 380

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
