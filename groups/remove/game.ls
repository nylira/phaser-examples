'use strict'
{map} = require \prelude-ls
var items

preload = ->
  g.load.spritesheet \item \../../../phaser/examples/assets/buttons/number-buttons-90x90.png 90 90
  g.load.image \rect \../../../phaser/examples/assets/tests/200x100corners.png

create = ->
  items := g.add.group!

  for i til 6
    item = items.create 90, 90*i, \item, i
    item.input.start 0 true
    item.input.enable-drag!
    item.input.enable-snap 90 90 false true
    item.events.on-drag-stop.add drop-handler

  g.add.sprite 390 0 \rect |> (.scale.set-to 2.0 3.0)

render = ->
  g.debug.render-text "Size of group #{items.length}", 100, 560
  g.debug.render-text "Drop here to cut items from group entirely.", 390, 24

drop-handler = (item, pointer) ->
  if item.x < 90
    item.x = 90
  else if item.x > 400
    items.remove item
    console.log "Group length: #{items.length}"

g = new Phaser.Game 800, 600, Phaser.CANVAS, '', preload: preload, create: create
