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
  game.load.image \mushroom \../../../phaser/examples/assets/mushroom2.png

function create
  game.stage.background-color = '#2d2d2d'
  game.world.set-bounds 0 0 1600 1200

  shrooms := game.add.group!
  for i til 150
    shroom = shrooms.create game.world.random-x, game.world.random-y - 164, \mushroom

  cursors := game.input.keyboard.create-cursor-keys!

function update

  if cursors.up.is-down
    game.camera.y -= 4
  else if cursors.down.is-down
    game.camera.y += 4

  if cursors.left.is-down
    game.camera.x -= 4
  else if cursors.right.is-down
    game.camera.x += 4

function render
  game.debug.render-camera-info game.camera, 32, 32
