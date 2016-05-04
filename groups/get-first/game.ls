'use strict'
{map} = require \prelude-ls
timer = 1000       # timer starts at 1000 to prevent calling too early
delay = 1000       # duration between function calls

preload = ->
  g.load.spritesheet \item \../../../phaser/examples/assets/buttons/number-buttons-90x90.png 90 90
  g.load.image \revive-btn \../../../phaser/examples/assets/buttons/revive-button.png

create = ->
  map create-sprites, [0 til 3]

update = ->
  if g.time.now > timer
    timer-extend delay
    kill-oldest!

render = ->
  g.debug.render-text 'One of the items will be killed each second' 280 420
  g.debug.render-text "Living: #{g.world.count-living!} Dead: #{g.world.count-dead!}" 330 440

create-sprites = (i) ->
  create-sprite i, 0
  create-sprite i, 3

create-sprite = (i, displacement) ->
  s = g.add.sprite 290 + (33 * displacement), 98 * (i + 1), \item, i + displacement

timer-extend = (delay) ->
  timer := g.time.now + delay

kill-oldest = ->
  item = g.world.get-first-alive!
  item.kill! if item

g = new Phaser.Game 800, 600, Phaser.CANVAS, '', preload: preload, create: create, update: update, render: render
