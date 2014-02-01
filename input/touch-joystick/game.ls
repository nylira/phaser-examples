'use strict'
#{map} = require \prelude-ls
var ufo
ufo-speed = 200

g-preload = !->
  g.world.set-bounds 0 0 800 600
  g.load.image \ufo \assets/sprites/ufo.png

g-create = !->
  ufo := g.add.sprite 320 240 \ufo
  ufo.anchor.set-to 0.5 0.5

  GameController.init(
    left:
      type: \joystick
      joystick:
        touch-start: ->
        touch-move: (joystick-details) ->
          g.input.joystick-left = joystick-details
        touch-end: ->
          g.input.joystick-left = null
    right:
      type: \none
  )

g-update = !->
  if g.input.joystick-left 
    x = g.input.joystick-left.normalized-x * 200
    y = g.input.joystick-left.normalized-y * ufo-speed * -1
    ufo.body.velocity.set-to x, y
  else
    ufo.body.velocity.set-to 0 0

g-render = !->
  g.debug.render-text 'Use the virtual joystick to move the UFO.' 20 20
  g.debug.render-text 'This requires touch events, so try on your phone.' 20 40

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
