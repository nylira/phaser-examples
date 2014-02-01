'use strict'
var cursors

g-preload = ->
  game.stage.background-color = \#007236
  game.load.image \image-mushroom \assets/sprites/mushroom2.png
  game.load.image \image-phaser \assets/sprites/sonic_havok_sanity.png

g-create = ->
  game.world.set-bounds 0 0 1600 1200

  for i til 100
    game.add.sprite game.world.random-x, game.world.random-y, \image-mushroom

  cursors := game.input.keyboard.create-cursor-keys!

g-update = ->

  if cursors.up.is-down
    if cursors.up.shift-key
      game.world.rotation += 0.05
    else
      game.camera.y -= 4

  else if cursors.down.is-down
    if cursors.down.shift-key
      game.world.rotation -= 0.05
    else
      game.camera.y += 4

  if cursors.left.is-down
    game.camera.x -= 4
  else if cursors.right.is-down
    game.camera.x += 4
     
g-render = ->
  game.debug.render-camera-info game.camera, 32, 32

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
