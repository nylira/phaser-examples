'use strict'

game = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
)

function preload
  game.load.image \ball \assets/sprites/shinyball.png

var bmd

wave-size = 8
wave-pixel-chunk = 2
var wave-data, wave-data-counter

function create
  bmd := game.add.bitmap-data \ball 32 64

  for i til 100
    game.add.sprite game.world.random-x, game.world.random-y, bmd

  wave-data := game.math.sin-cos-generator 32, 8, 8, 2

function update
  bmd.clear!
  update-wobbly-ball!

update-wobbly-ball = ->
  s = 0
  copy-rect = {x: 0, y: 0, w: wave-pixel-chunk, h: 32}
  copy-point = {x: 0, y: 0}

  for i til 32 by wave-pixel-chunk
    copy-point.x = x
    copy-point.y = wave-size + (wave-size/2) + wave-data.sin[s]

    bmd.context.draw-image(
      game.cache.get-image \ball,
      copy-rect.x, copy-rect.y, copy-rect.w, copy-rect.h,
      copy-point.x, copy-point.y, copy-rect.w, copy-rect.h
    )

    copy-rect.x += wave-pixel-chunk

    s++

  bnd.render!

  # cycle through the wave data - this is what causes the image to 'undulate'
  game.math.shift wave-data.sin

  wave-data-counter++

  if wave-data-counter == wave-data.length
    wave-data-counter := 0
