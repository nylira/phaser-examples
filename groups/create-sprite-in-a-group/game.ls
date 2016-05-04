'use strict'
{map} = require \prelude-ls

var friend-and-foe, enemies

preload = ->
  g.load.image \ufo \../../../phaser/examples/assets/sprites/ufo.png
  g.load.image \baddie \../../../phaser/examples/assets/sprites/space-baddie.png

create = ->
  friend-and-foe := g.add.group!
  enemies := g.add.group!

  friend-and-foe.create 200 240 \ufo

  map create-baddie, [0 til 8]

  g.input.on-tap.add create-baddie, @

render = ->
  g.debug.render-text 'Tap screen or click to create new baddies.' 16 24

create-baddie = (i) ->
  x = 360 + Math.random! * 200
  y = 120 + Math.random! * 200
  s = g.add.sprite x, y, \baddie

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload, create: create, render: render)
