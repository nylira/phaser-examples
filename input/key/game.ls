'use strict'
#{map} = require \prelude-ls
var sprite, key-up, key-down, key-left, key-right

game-preload = ->
  game.load.image \image-phaser \../../../phaser/examples/assets/sprites/phaser-dude.png

game-create = ->
  game.stage.background-color = \#736357
  sprite := game.add.sprite 300 300 \image-phaser

  #cursors := game.input.keyboard.create-cursor-keys!
  key-up := game.input.keyboard.add-key Phaser.Keyboard.UP
  key-down := game.input.keyboard.add-key Phaser.Keyboard.DOWN
  key-left := game.input.keyboard.add-key Phaser.Keyboard.LEFT
  key-right := game.input.keyboard.add-key Phaser.Keyboard.RIGHT

game-update = ->
  if key-left.is-down
    sprite.x -= 4
  else if key-right.is-down
    sprite.x += 4

  if key-up.is-down
    sprite.y -= 4
  else if key-down.is-down
    sprite.y += 4

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: game-preload, create: game-create, update: game-update)
