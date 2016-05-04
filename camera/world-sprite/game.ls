'use strict'

game = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

var cursors
var shrooms

function preload
  game.load.image \backdrop \../../../phaser/examples/assets/pics/remember-me.jpg
  game.load.image \card \../../../phaser/examples/assets/sprites/mana_card.png

var card
const Keys = Phaser.Keyboard

function create
  game.world.set-bounds 0 0 800 600

  game.add.sprite 0 0 \backdrop

  card := game.add.sprite 200 200 \card
  card.body.velocity.x = 50
  card.scale.set-to 2 2

  card.body.collide-world-bounds = true

function update
  if game.input.keyboard.is-down Keys.LEFT
    card.x -= 4
  else if game.input.keyboard.is-down Keys.RIGHT
    card.x += 4

  if game.input.keyboard.is-down Keys.UP
    card.y -= 4
  else if game.input.keyboard.is-down Keys.DOWN
    card.y += 4

function render
  game.debug.render-camera-info game.camera, 32, 32
  game.debug.render-sprite-coords card, 32, 400
