'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  create: create
  render: render
)

var floor

function create
  floor := new Phaser.Rectangle 0 550 800 50

function render
  game.debug.render-rectangle floor, \#0fffff

