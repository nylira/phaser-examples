'use strict'
assets = \../../../phaser/examples/assets/
var emitter-front, emitter-mid, emitter-back
max = 0
update-interval = 4 * 60
i = 0

g-preload = !->
  g.load.spritesheet \snowflakes assets+\sprites/snowflakes.png 17 17
  g.load.spritesheet \snowflakes-large assets+\sprites/snowflakes_large.png 64 64

g-create = !->
  emitter-back = g.add.emitter g.world.center-x, -32, 600
  emitter-back.make-particles \snowflakes [0 to 5]
  emitter-back.max-particle-scale = 0.6
  emitter-back.min-particle-scale = 0.2
  emitter-back.set-y-speed 20 100
  emitter-back.gravity = 0
  emitter-back.width = g.world.width * 1.5
  emitter-back.min-rotation = 0
  emitter-back.max-rotation = 40

  emitter-mid = g.add.emitter g.world.center-x, -32, 250
  emitter-mid.make-particles \snowflakes [0 to 5]
  emitter-mid.max-particle-scale = 1.2
  emitter-mid.min-particle-scale = 0.8
  emitter-mid.set-y-speed 50 150
  emitter-mid.gravity = 0
  emitter-mid.width = g.world.width * 1.5
  emitter-mid.min-rotation = 0
  emitter-mid.max-rotation = 40

  emitter-front = g.add.emitter g.world.center-x, -32, 50
  emitter-front.make-particles \snowflakes-large [0 to 5]
  emitter-front.max-particle-scale = 1
  emitter-front.min-particle-scale = 0.5
  emitter-front.set-y-speed 100 200
  emitter-front.gravity = 0
  emitter-front.width = g.world.width * 1.5
  emitter-front.min-rotation = 0
  emitter-front.max-rotation = 40

  emitter-back.start false 14000 20
  emitter-mid.start false 12000 40
  emitter-front.start false 6000 1000

g-update = !->
g-render = !->

g = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
