'use strict'
#{map} = require \prelude-ls
assets = \../../../phaser/examples/assets/
filters = \../../../phaser/filters/
var filter

g-preload = !->
  g.load.image \phaser assets+\sprites/phaser.png
  g.load.image \texture assets+\textures/ooze.png
  g.load.script \filter filters+\Tunnel.js

g-create = !->
  bg = g.add.sprite 0 0 \texture
  bg.width = 800
  bg.height = 600

  filter := g.add.filter \Tunnel, 800, 600, bg.texture
  filter.origin = 1.0

  bg.filters = [filter]

  logo = g.add.sprite g.world.center-x, g.world.center-y, \phaser
  logo.anchor.set-to 0.5 0.5

g-update = !->
  filter.update!

g-render = !->

g = new Phaser.Game(800, 600, Phaser.WEBGL, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
