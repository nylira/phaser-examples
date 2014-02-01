'use strict'

game = new Phaser.Game(800, 768, Phaser.AUTO, '', {
  preload: preload
  create: create
})

function preload()
  game.load.image('sky', '../../../phaser/examples/assets/misc/starfield.png')

function create()
  game.add.sprite(0, 0, 'sky')
