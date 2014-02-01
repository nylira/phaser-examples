'use strict'
{map} = require \prelude-ls
base-alpha-inc-speed = 0.006

preload = ->
  g.load.spritesheet \item \assets/buttons/number-buttons-90x90.png 90 90

create = ->
  map create-sprites, [0 til 3]

update = ->
  g.world.for-each (item) ->
    item.alpha -= item.alpha-inc-speed

    if item.alpha < 0.01 || item.alpha > 0.99
      item.alpha-inc-speed *= -1

render = ->
  g.debug.render-text 'Alpha of the items are always changing' 280 480

create-sprites = (i) ->
  create-sprite i, 0
  create-sprite i, 3

create-sprite = (i, displacement) ->
  s = g.add.sprite 290 + (33 * displacement), 98 * (i + 1), \item, i + displacement
  s.alpha = Math.random!.to-fixed 2
  s.alpha-inc-speed = base-alpha-inc-speed

g = new Phaser.Game 800, 600, Phaser.CANVAS, '', preload: preload, create: create, update: update, render: render
