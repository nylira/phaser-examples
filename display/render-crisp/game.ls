'use strict'

game = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
)

function preload
  game.load.image \boss \assets/misc/boss1.png
  game.load.spritesheet \button \assets/buttons/button_sprite_sheet.png 193 71

var boss, button

function create
  #Phaser.Canvas.set-smoothing-enabled game.context, false

  boss := game.add.sprite game.world.center-x, game.world.center-y, \boss
  boss.scale.set-to 0.5 0.5
  boss.anchor.set-to 0.5 0.5

  button := game.add.button 32, 32, \button, clicked-it, @, 2, 1, 0

clicked-it = ->
  boss.scale.x += 0.5
  boss.scale.y += 0.5
