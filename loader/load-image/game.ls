'use strict'
assets = \../../../phaser/examples/assets/

g-preload = !->
  # Specify a unique key and a URL path
  # The key must be unique between all images

  g.load.image \image-key assets+\sprites/phaser2.png

g-create = !->
  g.add.sprite 0 0 \image-key

g-update = !->

g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
