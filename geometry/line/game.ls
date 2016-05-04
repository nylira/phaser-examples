'use strict'

game = new Phaser.Game(800, 600, Phaser.WEBGL, '',
  create: create
)

function create
  g = game.add.graphics 50 50

  g.begin-fill 0xff0000
  g.line-style 10 0xff0000 1

  g.move-to 50 50
  g.line-to 250 50
  g.end-fill!
