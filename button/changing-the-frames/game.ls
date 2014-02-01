'use strict'

game = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
)

function preload()
  game.load.spritesheet \button \assets/number-buttons-90x90.png 90 90
  game.load.image \background \assets/starfield.jpg

var button

function create()
  game.stage.background-color = '#182d3b'

  # frames are HOVER, NORMAL, CLICK for some stupid reason
  button := game.add.button(game.world.center-x, game.world.center-y, \button, on-click, @, 1, 0, 2)

  button.anchor.set-to 0.5 0.5

on-click = ->
  button.set-frames 4, 3, 5
