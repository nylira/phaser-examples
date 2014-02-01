'use strict'

g = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
)

function preload()
  g.load.spritesheet \button \../../../phaser/examples/assets/buttons/button_sprite_sheet.png 193 71
  g.load.image \background \../../../phaser/examples/assets/misc/starfield.jpg


var background
var button

function create()
  g.add.tile-sprite 0 0 800 600 \background

  button := g.add.button(g.world.center-x, g.world.center-y, \button, on-click, @, 2, 1, 0)
  button.anchor.set-to 0.5 0.5

function update()
  button.angle += 1

on-click = ->
  alert "Though I'm turning around, you can still click on me"
