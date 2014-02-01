'use strict'

game = new Phaser.Game(1200, 768, Phaser.AUTO, '', {
  preload: preload
  create: create
  update: update
})

var bot

function preload()
  game.load.atlas-JSON-hash('bot', 'assets/running_bot.png', 'assets/running_bot.json');

function create()
  bot := game.add.sprite(200, 200, 'bot')
  bot.animations.add('run')
  bot.animations.play('run', 15, true)

function update()

  bot.body.velocity.x = -600

  if bot.x < -bot.width
    bot.x = game.world.width
    bot.y = Math.floor(Math.random! * game.world.height)
