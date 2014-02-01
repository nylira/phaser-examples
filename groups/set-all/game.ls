'use strict'
#{map} = require \prelude-ls
base-inc-speed = 0.006

preload = ->
  g.load.spritesheet \item \../../../phaser/examples/assets/buttons/number-buttons-90x90.png 90 90

create = ->
  for i til 3

    g.add.sprite 290, 98 * (i + 1), \item, i
    .alpha-inc-speed = base-inc-speed * (i + 1)

    g.add.sprite 388, 98 * (i + 1), \item, i + 3
    .alpha-inc-speed = base-inc-speed * (i + 45)

  g.input.on-tap.add reset-alpha, @

reset-alpha = ->
  g.world.set-all \alpha Math.random!

render = ->
  g.debug.render-text "Click an item to randomize alpha" 240 480

g = new Phaser.Game 800, 600, Phaser.CANVAS, '', preload: preload, create: create, render: render
