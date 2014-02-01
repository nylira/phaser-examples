'use strict'

game = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
)

function preload()
  game.load.spritesheet \button \../../../phaser/examples/assets/button_sprite_sheet.png 193 71
  game.load.image \background \../../../phaser/examples/assets/starfield.jpg


var background
var button

function create()
  game.stage.background-color = '#cccccc'

  button := game.add.button(game.world.center-x, game.world.center-y, \button, on-click, @, 2, 1, 0)
  button.anchor.set-to 0.5 0.5

function update()
  button.angle += 1

on-click = ->
  alert "Though I'm turning around, you can still click on me"
