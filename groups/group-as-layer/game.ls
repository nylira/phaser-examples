'use strict'
{map} = require \prelude-ls

preload = ->
  g.world.set-bounds 0 0 1280 800

  g.load.image \ground \assets/tests/ground-2x.png
  g.load.image \river \assets/tests/river-2x.png
  g.load.image \sky \assets/tests/sky-2x.png
  g.load.image \cloud0 \assets/tests/cloud-big-2x.png
  g.load.image \cloud1 \assets/tests/cloud-narrow-2x.png
  g.load.image \cloud2 \assets/tests/cloud-small-2x.png

  g.load.spritesheet \ufo \assets/sprites/ufo.png 24 21

create = ->
  sky-layer = g.add.group!
  sky-layer.z = 0

  cloud-layer = g.add.group!
  cloud-layer.z = 1

  ground-layer = g.add.group!
  ground-layer.z = 2

  sprite-layer = g.add.group!
  sprite-layer.z = 3

  river-layer = g.add.group!
  river-layer.z = 3

  sky-layer.create 0 0 \sky

  cloud-layer.create 200 120 \cloud0
  cloud-layer.create -60 120 \cloud1
  cloud-layer.create 900 170 \cloud2

  ground-layer.create 0 360 \ground

  river-layer.create 0 400 \river

  ufo = sprite-layer.create 360 240 \ufo
  ufo.anchor.set-to 0.5, 0.5

render = ->
  g.debug.render-text 'layer-sky:     z = 0' 16 20
  g.debug.render-text 'layer-cloud:   z = 1' 16 36
  g.debug.render-text 'layer-ground:  z = 2' 16 52
  g.debug.render-text 'layer-sprite:  z = 3' 16 68
  g.debug.render-text 'layer-river:   z = 4' 16 84

g = new Phaser.Game 800, 600, Phaser.CANVAS, '', preload: preload, create: create, render: render
