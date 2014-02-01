'use strict'

game = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

var ufo
keys = Phaser.Keyboard
speed = 4
style = \default

function preload()
  game.load.image \ground \../../../phaser/examples/assets/ground-2x.png
  game.load.image \river \../../../phaser/examples/assets/river-2x.png
  game.load.image \sky \../../../phaser/examples/assets/sky-2x.png
  game.load.image \cloud0 \../../../phaser/examples/assets/cloud-big-2x.png
  game.load.image \cloud1 \../../../phaser/examples/assets/cloud-narrow-2x.png
  game.load.image \cloud2 \../../../phaser/examples/assets/cloud-small-2x.png
  game.load.image \ufo \../../../phaser/examples/assets/ufo.png
  game.load.image \baddie \../../../phaser/examples/assets/space-baddie.png
  game.load.spritesheet \button \../../../phaser/examples/assets/follow-style-button.png 224 70

function create()
  game.world.set-bounds 0 0 1400 1400

  for i from 0 til 10 by 1
    game.add.sprite game.world.random-x, game.world.random-y, \baddie

  # backgrounds
  game.add.tile-sprite 0 0 1400 600 \sky
  game.add.sprite 0 360 \ground
  game.add.sprite 0 400 \river
  game.add.sprite 200 120 \cloud0
  game.add.sprite -60 120 \cloud1
  game.add.sprite 900 170 \cloud2

  # ufo sprite
  ufo := game.add.sprite 300 240 \ufo

  # registration point
  ufo.anchor.set-to 0.5 0.5

  console.log ufo

  game.camera.follow ufo

  # buttons
  btn0 = game.add.button 6, 40, \button, lockon-follow, @, 0, 0, 0
  btn1 = game.add.button 6, 120, \button, platformer-follow, @, 1, 1, 1
  btn2 = game.add.button 6, 200, \button, topdown-follow, @, 2, 2, 2
  btn3 = game.add.button 6, 280, \button, topdown-tight-follow, @, 3, 3, 3

lockon-follow = ->
  game.camera.follow ufo, Phaser.Camera.FOLLOW_LOCKON
  style := \STYLE_LOCKON

platformer-follow = ->
  game.camera.follow ufo, Phaser.Camera.FOLLOW_PLATFORMER
  style := \STYLE_PLATFORMER

topdown-follow = ->
  game.camera.follow ufo, Phaser.Camera.FOLLOW_TOPDOWN
  style := \STYLE_TOPDOWN

topdown-tight-follow = ->
  game.camera.follow ufo, Phaser.Camera.FOLLOW_TOPDOWN_TIGHT
  style := \STYLE_TOPDOWN_TIGHT

function update()
  if game.input.keyboard.is-down keys.LEFT
    ufo.x -= speed
    ufo.angle = -15
  else if game.input.keyboard.is-down keys.RIGHT
    ufo.x += speed
    ufo.angle = 15
  else if game.input.keyboard.is-down keys.UP
    ufo.y -= speed
  else if game.input.keyboard.is-down keys.DOWN
    ufo.y += speed
  else
    ufo.angle = 0

function render()
  game.debug.render-text 'Click buttons to switch follow styles' 32 32
  game.debug.render-text "Current style: #{style}" 32 64
