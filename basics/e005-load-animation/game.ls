'use strict'

game = new Phaser.Game(1200, 768, Phaser.AUTO, '', {
  preload: preload
  create: create
})

function preload()
  game.load.spritesheet('dude', 'assets/dude.png', 32, 48)

function create()
  dude = game.add.sprite(200, 200, 'dude')

  dude.animations.add('left', [0 1 2 3], 10, true)
  dude.animations.add('right', [5 6 7 8], 10, true)

  dude.animations.play('left')
