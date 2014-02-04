'use strict'
assets = \../../../phaser/examples/assets/

g-preload = !->
  g.load.image \atari1 assets+\sprites/atari130xe.png
  g.load.image \atari2 assets+\sprites/atari800xl.png
  g.load.image \atari4 assets+\sprites/atari800.png
  g.load.image \sonic assets+\sprites/sonic_havok_sanity.png
  g.load.image \duck assets+\sprites/darkwing_crazy.png
  g.load.image \firstaid assets+\sprites/firstaid.png
  g.load.image \diamond assets+\sprites/diamond.png
  g.load.image \mushroom assets+\sprites/mushroom2.png

g-create = !->
  # This returns an array of all the image keys in the cache
  images = g.cache.get-image-keys!

  # Now let's create some random sprites and enable them all for drag
  # and bring to top
  for i til 20
    img = g.rnd.pick images
    tmp-sprite = g.add.sprite g.world.random-x, g.world.random-y, img
    tmp-sprite.input-enabled = true
    tmp-sprite.input.enable-drag false true

g-update = !->

g-render = !->
  g.debug.render-input-info 32 32

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
