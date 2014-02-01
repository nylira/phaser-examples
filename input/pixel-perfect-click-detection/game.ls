'use strict'
#{map} = require \prelude-ls
var b

g-preload = !->
  g.load.image \img-bunny \assets/sprites/bunny.png

g-create = !->
  b := g.add.sprite g.world.center-x, g.world.center-y, \img-bunny
  b.anchor.set-to 0.5 0.5

  # listen for input events
  b.input-enabled = true

  # check the pixel data of the sprite
  b.input.pixel-perfect = true

  # enable the hand cursor
  b.input.use-hand-cursor = true

  b.events.on-input-over.add sprite-over, @
  b.events.on-input-out.add sprite-out, @

g-update = !-> b.angle += 0.05

g-render = !->
  g.debug.render-sprite-input-info b, 32, 32
  g.debug.render-sprite-corners b
  g.debug.render-point b.input._temp-point

sprite-over = -> console.log \over
sprite-out = -> console.log \out

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
