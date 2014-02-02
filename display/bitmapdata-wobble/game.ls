'use strict'
{map} = require \prelude-ls
assets = \../../../phaser/examples/assets/
var bmd, wave-data, wave-data-counter
wave-size = 8
wave-pixel-chunk = 2

g-preload = !->
  g.load.image \ball assets+\sprites/shinyball.png

g-create = !->
  # Create our BitmapData object at a size of 32x64
  bmd := g.add.bitmap-data 32 64

  for i til 100
    g.add.sprite(g.world.random-x, g.world.random-y, bmd)

  wave-data := g.math.sin-cos-generator 32, 8, 8, 2

g-update = !->
  bmd.clear!
  update-wobbly-ball!

g-render = !->

update-wobbly-ball = ->
  s = 0
  copy-rect = {x: 0, y: 0, w: wave-pixel-chunk, h: 32}
  copy-point = {x: 0, y: 0}

  for x til 32 by wave-pixel-chunk
    copy-point.x = x
    copy-point.y = wave-size + (wave-size/2) + wave-data.sin[s]

    bmd.context.draw-image(
      g.cache.get-image(\ball),
      copy-rect.x, copy-rect.y, copy-rect.w, copy-rect.h,
      copy-point.x, copy-point.y, copy-rect.w, copy-rect.h
    )

    copy-rect.x += wave-pixel-chunk

    s++

  bmd.render!

  # cycle through the wave data - this is what causes the image to 'undulate'
  g.math.shift wave-data.sin

  wave-data-counter++

  if wave-data-counter == wave-data.length
    wave-data-counter := 0

g = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
