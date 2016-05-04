'use strict'

game = new Phaser.Game(1200, 768, Phaser.AUTO, '', {
  preload: preload
  create: create
  update: update
  render: render
})

function preload()
  game.load.image('bird', '../../../phaser/examples/assets/sprites/ufo.png')
  game.load.image('sky', '../../../phaser/examples/assets/misc/starfield.png')

var image

function create()
  game.add.sprite(0, 0, 'sky')
  image := game.add.sprite(0, 0, 'bird')

function update()
  game.physics.move-to-pointer(image, 300, game.input.active-pointer)

function render()
  game.debug.render-input-info(32, 32)
