'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
)

var friend-and-foe, enemies

function preload
  game.load.image \ufo \../../../phaser/examples/assets/sprites/ufo.png
  game.load.image \baddie \../../../phaser/examples/assets/sprites/space-baddie.png

function create
  friend-and-foe = game.add.group!
  enemies = game.add.group!

  for i from 0 til 16
    x = 320 + Math.random! * 200
    y = 120 + Math.random! * 200
    enemies.create x, y, \baddie

  ufo = game.add.sprite 200 240 \ufo
  friend-and-foe.add ufo
