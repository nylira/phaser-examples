'use strict'
{map} = require \prelude-ls

game-preload = ->
  game.load.spritesheet \image-item \../../../phaser/examples/assets/buttons/number-buttons-90x90.png 90 90

game-create = ->
  map add-item, [0 til 6]

game-render = ->
  game.debug.render-text 'Group Left.' 100 560
  game.debug.render-text 'Group Right.' 280 560

add-item = (i) ->
  item = game.add.sprite 90, 90 * i, \image-item, i
  item.input.start 0 true
  item.input.enable-drag!
  item.input.enable-snap 90 90 false true
  item.events.on-drag-stop.add fix-location

# force the snappable buttons to stay in the first 4 columns
fix-location = (item) ->
  if item.x < 90
    item.x - 90
  else if item.x > 180 && item.x < 270
    item.x = 180
  else if item.x > 360
    item.x = 270

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: game-preload, create: game-create, render: game-render)
