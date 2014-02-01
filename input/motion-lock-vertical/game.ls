'use strict'
#{map} = require \prelude-ls
var sprite

g-preload = !->
  g.load.image \img-sprite \assets/sprites/darkwing_crazy.png

g-create = !->
  g.stage.background-color = 'hsl(0,0%,33%)'

  sprite := g.add.sprite 200 400 \img-sprite

  # enable input detection. disabled by default: enable for interaction
  sprite.input.start 0 true
  # enable dragging. (true): drag from current position, (false) drag from center
  sprite.input.enable-drag!
  # lock the sprite so it can only be dragged horizontally
  sprite.input.allow-horizontal-drag = false

g-render = !->
  g.debug.render-input-info 32 32
  g.debug.render-sprite-input-info sprite, 300, 32

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, render: g-render)
