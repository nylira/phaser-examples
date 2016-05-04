'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  create: create
  update: update
  render: render
)

var p1, p2
d = 0

function create
  p1 := new Phaser.Point 200 300
  p2 := new Phaser.Point 300 300

function update
  p1.rotate p2.x, p2.y, game.math.wrap-angle(d), true
  d++

function render
  game.context.fill-style = 'rgb(255,255,0)'
  game.context.fill-rect p1.x, p1.y, 4, 4

  game.context.fill-style = 'rgb(255,0,0)'
  game.context.fill-rect p2.x, p2.y, 4, 4
