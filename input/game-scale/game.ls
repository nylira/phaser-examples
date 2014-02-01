'use strict'
{map} = require \prelude-ls
var cursors

game-preload = ->
  game.stage.scale.max-width = 800
  game.stage.scale.max-height = 600

  # proportional scaling
  game.stage.scale-mode = Phaser.StageScaleMode.SHOW_ALL
  game.stage.scale.set-show-all!
  game.stage.scale.refresh!

  game.load.image \image-melon \../../../phaser/examples/assets/sprites/melon.png

game-create = ->
  game.world.set-bounds 0 0 2000 2000

  for i til 1000
    game.add.sprite game.world.random-x, game.world.random-y, \image-melon

  cursors := game.input.keyboard.create-cursor-keys!

game-update = ->
  if cursors.left.is-down
    game.camera.x -= 4
  else if cursors.right.is-down
    game.camera.x += 4

  if cursors.up.is-down
    game.camera.y -= 4
  else if cursors.down.is-down
    game.camera.y += 4

game-render = ->
  game.debug.render-input-info 16 16

game = new Phaser.Game(320, 240, Phaser.CANVAS, '',
  preload: game-preload, create: game-create, update: game-update, render: game-render)
