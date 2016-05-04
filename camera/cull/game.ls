'use strict'

game = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

var alien
var cursors

function preload()
  game.load.image \alien \../../../phaser/examples/assets/sprites/ra_dont_crack_under_pressure.png

function create()
  game.stage.background-color = 'hsl(210,50%,25%)'

  alien := game.add.sprite(game.world.center-x, game.world.center-y, \alien)
  alien.anchor.set-to 0.5 0.5

  game.input.on-down.(console.log "clicked this board")

  cursors := game.input.keyboard.create-cursor-keys!

function update()
  alien.rotation += 0.01

  if cursors.up.is-down
    alien.y -= 4
  else if cursors.down.is-down
    alien.y += 4

  if cursors.left.is-down
    alien.x -= 4
  else if cursors.right.is-down
    alien.x += 4

function render()
  game.debug.render-sprite-corners alien, true, true
  game.debug.render-sprite-info alien, 20, 32

