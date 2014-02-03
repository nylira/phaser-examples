'use strict'
#{map} = require \prelude-ls
assets = \../../../phaser/examples/assets/
filters = \../../../phaser/filters/
var filter

g-preload = !->
  g.load.image \phaser assets+\sprites/phaser.png
  g.load.script \filter filters+\LightBeam.js

g-create = !->
  logo = g.add.sprite g.world.center-x, g.world.center-y, \phaser
  logo.anchor.set-to 0.5 0.5

  bg = g.add.sprite 0 0
  bg.width = 800
  bg.height = 600

  filter := g.add.filter \LightBeam 800 600
  filter.alpha = 0.0

  bg.filters = [filter]

g-update = !->
  filter.update!

g-render = !->

g = new Phaser.Game(800, 600, Phaser.WEBGL, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
