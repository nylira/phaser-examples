'use strict'
#{map} = require \prelude-ls
assets = \../../../phaser/examples/assets/
filters = \../../../phaser/filters/

g-preload = !->
  g.load.image \phaser assets+\sprites/phaser2.png
  g.load.script \filterX filters+\BlurX.js
  g.load.script \filterY filters+\BlurY.js

g-create = !->
  logo = g.add.sprite g.world.center-x, g.world.center-y, \phaser
  logo.anchor.set-to 0.5 0.5

  blur-x = g.add.filter \BlurX
  blur-y = g.add.filter \BlurY

  logo.filters = [blur-x, blur-y]

g-update = !->

g-render = !->

g = new Phaser.Game(800, 600, Phaser.WEBGL, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
