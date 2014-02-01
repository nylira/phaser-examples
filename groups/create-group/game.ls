'use strict'
{map} = require \prelude-ls

var first-group

preload = ->
  g.load.image \sonic \../../../phaser/examples/assets/sprites/sonic_havok_sanity.png

create = ->
  first-group := g.add.group!
  first-group.name = \JOYEE

  map create-sprite, [0 til 10]

render = ->
  g.debug.render-text 'Tap or click an item to kill it, and press the revive button to revive them all' 80 500

create-sprite = (i) ->
  s = g.add.sprite g.world.random-x, g.world.random-y, \sonic
  s.events.on-added-to-group.add log-group-add
  first-group.add s

log-group-add = (sprite, group) ->
  console.log('Sprite added to Group', group.name, 'at z-index:', group.get-index(sprite))

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload, create: create, render: render)
