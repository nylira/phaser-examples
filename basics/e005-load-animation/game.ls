'use strict'

game = new Phaser.Game(800, 768, Phaser.AUTO, '', {
  preload: preload
  create: create
})

function preload()
  game.load.atlas-JSON-hash('bot', '../../../phaser/examples/assets/sprites/running_bot.png', '../../../phaser/examples/assets/sprites/running_bot.json')

function create()
  dude = game.add.sprite 200, 200, \bot

  dude.animations.add('run')

  dude.animations.play('run', 15, true)
