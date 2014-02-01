'use strict'
{map, each} = require \prelude-ls

preload = ->
  g.load.spritesheet \item \../../../phaser/examples/assets/buttons/number-buttons-90x90.png 90 90
  g.load.image \revive-button \../../../phaser/examples/assets/buttons/revive-button.png

create = ->
  map create-items, [0 til 3]

  g.add.button 270, 400 \revive-button, revive-all, @, 0, 0, 0

render = ->
  g.debug.render-text 'Tap or click an item to kill it, and press the revive button to revive them all' 80 500

create-items = (i) ->
  create-killable-sprite 290, 98, i, 0
  create-killable-sprite 388, 98, i, 3

create-killable-sprite = (x, y, i, j) ->
  item = g.add.sprite x, y * (i + 1), \item, i + j
  item.input.start 0 true
  item.events.on-input-up.add kill

kill = (item) -> item.kill!

revive-all = -> g.world.call-all \revive

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload, create: create, render: render)
