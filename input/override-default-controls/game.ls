'use strict'
#{map} = require \prelude-ls
var spr-ufo, btn-left, btn-right, btn-space
speed = 4

g-preload = !->
  g.world.set-bounds 0 0 1280 600

  g.load.image \img-ground \assets/tests/ground-2x.png
  g.load.image \img-river \assets/tests/river-2x.png
  g.load.image \img-sky \assets/tests/sky-2x.png
  g.load.image \img-cloud0 \assets/tests/cloud-big-2x.png
  g.load.image \img-cloud1 \assets/tests/cloud-narrow-2x.png
  g.load.image \img-cloud2 \assets/tests/cloud-small-2x.png

  g.load.spritesheet \spr-button \assets/buttons/arrow-button.png 112 95
  g.load.image \img-spacebar \assets/buttons/spacebar.png

  g.load.image \img-ufo \assets/sprites/ufo.png

g-create = !->
  g.add.tile-sprite 0 0 1280 600 \img-sky
  g.add.sprite 0 360 \img-ground
  g.add.sprite 0 400 \img-river
  g.add.sprite 200 120 \img-cloud0
  g.add.sprite -60 120 \img-cloud1
  g.add.sprite 900 160 \img-cloud2

  spr-ufo := g.add.sprite 640 240 \img-ufo
  spr-ufo.anchor.set-to 0.5 0.5
  spr-ufo.body.collide-world-bounds = true

  g.camera.follow spr-ufo

  btn-left := g.add.sprite 0, 240, \spr-button, 0
  btn-left.anchor.set-to 0.5 0.5
  btn-left.alpha = 0

  btn-right := g.add.sprite 0, 240, \spr-button, 1
  btn-right.anchor.set-to 0.5 0.5
  btn-right.alpha = 0
  
  btn-space := g.add.sprite 0, 560, \img-spacebar
  btn-space.anchor.set-to 0.5 0.5
  btn-space.alpha = 0

  # prevent arrow keys and the space key from affecting the browser
  # these will make the web page scroll which is not expected
  g.input.keyboard.add-key-capture(
    Phaser.Keyboard.LEFT
    Phaser.Keyboard.RIGHT
    Phaser.Keyboard.UP
    Phaser.Keyboard.DOWN
    Phaser.Keyboard.SPACEBAR
  )

g-update = !->
  btn-left.x = spr-ufo.x - 200
  btn-right.x = spr-ufo.x + 200
  btn-space.x = spr-ufo.x

  if g.input.keyboard.is-down Phaser.Keyboard.LEFT
    spr-ufo.x -= speed
    spr-ufo.angle = -15
    btn-left.alpha = 0.6
    btn-right.alpha = 0
  else if g.input.keyboard.is-down Phaser.Keyboard.RIGHT
    spr-ufo.x += speed
    spr-ufo.angle = 15
    btn-left.alpha = 0
    btn-right.alpha = 0.6
  else
    spr-ufo.rotation = 0
    btn-left.alpha = btn-right.alpha = 0

  if g.input.keyboard.just-pressed Phaser.Keyboard.SPACEBAR
    console.log 'space bar just pressed'
    btn-space.alpha = 1

  if btn-space.alpha > 0.03
    btn-space.alpha -= 0.03

g-render = !->
  g.debug.render-text 'Hold left/right to fly the UFO.'

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
