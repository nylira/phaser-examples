'use strict'

game = new Phaser.Game(1200, 768, Phaser.AUTO, '', {
  preload: preload
  create: create
})

function preload()
  game.load.image('sky', 'assets/sky.png')

function create()
  image = game.add.sprite(0, 0, 'sky')
  image.input-enabled = true
  image.events.on-input-down.add(listener, this)

listener = ->
  alert 'clicked!'
