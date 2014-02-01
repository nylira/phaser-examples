'use strict'
#{map} = require \prelude-ls
var left, right
selected = null

preload = ->
  g.load.spritesheet \item \assets/buttons/number-buttons-90x90.png 90 90

create = !->
  left := g.add.group!
  right := g.add.group!

  var item

  for i til 3
    item = left.create 290, 98*(i+1), \item, i
    item.input.start 0 false true
    item.events.on-input-up.add select
    
    item = right.create 388, 98*(i+1), \item, i + 3
    item.input.start 0 true
    item.events.on-input-up.add select

select = (item, pointer) !->
  if !selected
    selected := item
    selected.alpha = 0.5
  else
    if selected.group != item.group
      item.x = selected.x
      item.y = selected.y
      selected.group.replace selected, item
    else
      selected.alpha = 1
    selected := null

render = ->
  g.debug.render-text "Left Group" 280 80
  g.debug.render-text "Right Group" 390 80
  g.debug.render-text "Click an item and one from another group to replace it." 240 480

g = new Phaser.Game 800, 600, Phaser.CANVAS, '', preload: preload, create: create, render: render
