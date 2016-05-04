'use strict'
game = new Phaser.Game 800, 600, Phaser.CANVAS, '', create: create

function create
  g = game.add.graphics 0 0

  g.begin-fill 0xff3300
  g.line-style 10 0xffd900 1

  # draw a shape
  g.move-to 0 50
  g.line-to 250 50
  g.line-to 100 100
  g.line-to 250 220
  g.line-to 50 220
  g.line-to 0 50
  g.end-fill!

  # set a fill and line style again
  g.line-style 10 0xFF0000 0.8
  g.begin-fill 0xFF700B 1

  # draw a second shape
  g.move-to 210 300
  g.line-to 450 320
  g.line-to 570 350
  g.line-to 580 20
  g.line-to 330 120
  g.line-to 410 200
  g.line-to 210 300
  g.end-fill!

  # draw a rectangle
  # width,  color,  opacity?
  for i til 25
    g.line-style 2 'hsla(240,100%,50%,0.5)' 1
    g.drawRect 50 + i * 10 250 + i * 10 100 100

  # draw a circle
  g.line-style 0
  g.begin-fill 0xFFFF0B 0.5
  g.draw-circle 470 200 100         # x, y, radius

  # draw diagonal line
  g.line-style 20 0x33FF00
  g.move-to 600 150
  g.line-to 30 450
