'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  create: create
  update: update
  render: render
)

var p1, p2, p3, p4
d2 = 0 
d3 = 0
d4 = 0

function create
  p1 := new Phaser.Point game.world.center-x, game.world.center-y
  p2 := new Phaser.Point p1.x - 50, p1.y - 50
  p3 := new Phaser.Point p2.x - 50, p2.y - 50
  p4 := new Phaser.Point p3.x - 50, p3.y - 50

function update
  p2.rotate p1.x, p1.y, game.math.wrap-angle(d2), true, 150
  p3.rotate p2.x, p2.y, game.math.wrap-angle(d3), true, 50
  p4.rotate p3.x, p3.y, game.math.wrap-angle(d4), true, 100

  d2 := d2 + 1
  d3 := d3 + 4
  d4 := d4 + 6

function render
  game.context.stroke-style = 'rgb(0,255,255)'
  game.context.begin-path!
  game.context.move-to p1.x, p1.y
  game.context.line-to p2.x, p2.y
  game.context.line-to p3.x, p3.y
  game.context.line-to p4.x, p4.y
  game.context.stroke!
  game.context.close-path!

  game.context.fill-style = 'rgb(255,255,0)'
  game.context.fill-rect p1.x, p1.y, 4, 4

  game.context.fill-style = 'rgb(255,0,0)'
  game.context.fill-rect p2.x, p2.y, 4, 4

  game.context.fill-style = 'rgb(0,255,0)'
  game.context.fill-rect p3.x, p3.y, 4, 4

  game.context.fill-style = 'rgb(0,0,255)'
  game.context.fill-rect p4.x, p4.y, 4, 4
