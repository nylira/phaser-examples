'use strict'

game = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
)

function preload()
  game.load.spritesheet \button \../../../phaser/examples/assets/buttons/button_sprite_sheet.png 193 71
  game.load.image \background \../../../phaser/examples/assets/misc/starfield.jpg

var background
var button

function create()
  game.stage.background-color = \#182d3b
  background := game.add.tile-sprite 0 0 800 600 \background

  button := game.add.button(400, 300, \button, on-click, @, 2, 1, 0)
  button.anchor.set-to 0.5 0.5

  # center the button x
  button.anchor.set-to 0.5 0.5
  button.x = game.world.center-x


function update()
  button.rotation += 0.01

on-click = ->
  background.visible =! background.visible
