'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  create: create
  render: render
)

var circle

function create
  circle := new Phaser.Circle game.world.center-x, 100, 64

function render
  game.debug.render-circle circle, \#cfffff
  game.debug.render-text "Diameter: #{circle.diameter}" 50 200
  game.debug.render-text "Circumference: #{circle.circumference!}" 50 230
