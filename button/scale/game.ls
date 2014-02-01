'use strict'

game = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  render: render
)

function preload()
  game.load.spritesheet \button \../../../phaser/examples/assets/button_sprite_sheet.png 193 71
  game.load.image \sky0 \../../../phaser/examples/assets/skies/space2.png
  game.load.image \sky1 \../../../phaser/examples/assets/skies/cavern1.png
  game.load.image \sky2 \../../../phaser/examples/assets/skies/chrome.png
  game.load.image \sky3 \../../../phaser/examples/assets/skies/fire.png
  game.load.image \sky4 \../../../phaser/examples/assets/skies/fog.png
  game.load.image \sky5 \../../../phaser/examples/assets/skies/sky1.png
  game.load.image \sky6 \../../../phaser/examples/assets/skies/toxic.png

var background
var btn1, btn2, btn3, btn4, btn5, btn6

function create()
  background := game.add.sprite 0 0 \sky0
  background.name = \background

  # standard button
  btn1 := game.add.button 100, 100, \button, change-sky, @, 2, 1, 0
  btn1.name = \sky1
  btn1.anchor.set-to 0.5 0.5

  # rotated button
  btn2 := game.add.button 330, 200, \button, change-sky, @, 2, 1, 0
  btn2.name = \sky2
  btn2.angle = 24
  btn2.anchor.set-to 0.5 0.5

  # width scaled button
  btn3 := game.add.button 100, 300, \button, change-sky, @, 2, 1, 0
  btn3.name = \sky3
  btn3.width = 300
  btn3.anchor.set-to 0.5 0.5
  # btn3.angle= 0.1

  # scaled button
  btn4 := game.add.button 300, 450, \button, change-sky, @, 2, 1, 0
  btn4.name = \sky4
  btn4.scale.set-to 2 2

  # shrunk button
  btn5 := game.add.button 100, 450, \button, change-sky, @, 2, 1, 0
  btn5.name = \sky5
  btn5.scale.set-to 0.5 0.5

  # scaled and rotated button
  btn6 := game.add.button 570, 200, \button, change-sky, @, 2, 1, 0
  btn6.name = \sky6
  btn6.angle = 32
  btn6.scale.set-to 2 2

  # works regardless of world angle, parent angle or camera position
  game.world.set-bounds 0 0 2000 2000
  game.world.angle = 3
  game.camera.x = 40

change-sky = (button)->
  background.load-texture button.name

function render()
  game.debug.render-sprite-corners btn1, false, true
