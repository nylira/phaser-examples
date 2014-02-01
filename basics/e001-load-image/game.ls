'use strict'

game = new Phaser.Game(1200, 768, Phaser.AUTO, '', {
  preload: preload
  create: create
})

function preload()
  game.load.image('sky', 'assets/sky.png')

function create()
  game.add.sprite(0, 0, 'sky')
