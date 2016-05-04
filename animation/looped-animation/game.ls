'use strict'

game = new Phaser.Game(800, 768, Phaser.AUTO, '', {
  preload: preload
  create: create
  update: update
})

var bot

function preload()
  game.load.atlas-JSON-hash('bot', '../../../phaser/examples/assets/sprites/running_bot.png', '../../../phaser/examples/assets/sprites/running_bot.json');

function create()
  bot := game.add.sprite(200, 200, 'bot')
  bot.animations.add('run')
  bot.animations.play('run', 15, true)

function update()

  bot.body.velocity.x = -200

  if bot.x < -bot.width
    bot.body.x = game.world.width
    bot.body.y = Math.floor(Math.random! * game.world.height)
