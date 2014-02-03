'use strict'
#{map} = require \prelude-ls
assets = \../../../phaser/examples/assets/
var handle1, handle2, handle3, handle4, line1, line2
c = 'hsl(0,0%,100%)'
p = new Phaser.Point!

g-preload = !->
  g.load.spritesheet \balls assets+\sprites/balls.png 17 17

g-create = !->
  g.stage.background-color = \#124184

  handle1 := g.add.sprite 100 200 \balls 0
  handle1.input-enabled = true
  handle1.input.enable-drag true

  handle2 := g.add.sprite 400 300 \balls 0
  handle2.input-enabled = true
  handle2.input.enable-drag true

  handle3 := g.add.sprite 200 400 \balls 1
  handle3.input-enabled = true
  handle3.input.enable-drag true

  handle4 := g.add.sprite 500 500 \balls 1
  handle4.input-enabled = true
  handle4.input.enable-drag true

  line1 := new Phaser.Line(handle1.x, handle1.y, handle2.x, handle2.y)
  line2 := new Phaser.Line(handle3.x, handle3.y, handle4.x, handle4.y)

g-update = !->
  line1.from-sprite handle1, handle2, true
  line2.from-sprite handle3, handle4, true

  p := line1.intersects line2, true

  if p => c := 'hsl(120,100%,50%)'
  else c := 'hsl(0,0%,100%)'

g-render = !->
  g.debug.render-line line1, c
  g.debug.render-line line2, c

  g.debug.render-line-info line1 32 32
  g.debug.render-line-info line2 32 100

  if p
    g.context.fill-style = 'hsl(300,100%,50)'
    g.context.fill-rect p.x - 2, p.y - 2, 5, 5

  g.debug.render-text "Drag the handles" 32 550

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
