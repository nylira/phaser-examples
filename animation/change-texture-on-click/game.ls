'use strict'

game = new Phaser.Game(1200, 768, Phaser.AUTO, '', {
  preload: preload
  create: create
  render: render
})


var bot

function preload()
  game.load.atlas-JSON-hash('bot', '../../../phaser/examples/assets/sprites/running_bot.png', '../../../phaser/examples/assets/sprites/running_bot.json')
  game.load.spritesheet('mummy', '../../../phaser/examples/assets/sprites/metalslug_mummy37x45.png', 37, 45, 18)
  
function create()
  bot := game.add.sprite(200, 200, 'bot')

  bot.animations.add('run')
  bot.animations.play('run', 15, true)
  game.input.on-down.add-once(change-mummy, this)

change-mummy = ->
  bot.load-texture('mummy', 0)
  bot.animations.add('walk')
  bot.animations.play('walk', 30, true)

function render()
  game.debug.render-sprite-bounds(bot)
