'use strict'
{map} = require \prelude-ls
var first-group

g-preload = ->
  g.load.image \sonic \../../../phaser/examples/assets/sprites/sonic_havok_sanity.png

g-create = ->
  first-group := g.add.group!
  map create-sprite, [0 til 10]

g-update = ->

g-render = ->

create-sprite = (i) ->
  s = first-group.create g.world.random-x, g.world.random-y, \sonic

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
