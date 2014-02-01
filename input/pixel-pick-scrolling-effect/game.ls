'use strict'
#{map} = require \prelude-ls
var m, s
cam-speed = 8

g-preload = !->
  g.load.spritesheet \mummy \../../../phaser/examples/assets/sprites/metalslug_mummy37x45.png 37 45 18
  g.load.image \stars \../../../phaser/examples/assets/misc/starfield.png

g-create = !->
  g.world.set-bounds 0 0 4000 2000

  s := g.add.tile-sprite 0 0 4000 600 \stars

  m := g.add.sprite 200, 200, \mummy
  m.anchor.set-to 0.5 0.5
  m.scale.set-to 6 6
  m.animations.add \walk
  m.animations.play \walk 5 true
  m.body.velocity.set-to 50 0

  m.input-enabled = true
  m.input.pixel-perfect = true
  m.input.use-hand-cursor = true

  m.events.on-input-over.add sprite-over, @
  m.events.on-input-over.add sprite-out, @

g-update = !->
  if g.input.keyboard.is-down Phaser.Keyboard.LEFT
    g.camera.x -= cam-speed
    if !g.camera.at-limit.x
      s.tile-position.x += cam-speed
  else if g.input.keyboard.is-down Phaser.Keyboard.RIGHT
    g.camera.x += cam-speed
    if !g.camera.at-limit.x
      s.tile-position.x -= cam-speed

  if g.input.keyboard.is-down Phaser.Keyboard.UP
    g.camera.y -= cam-speed
    if !g.camera.at-limit.y
      s.tile-position.y += cam-speed
  else if g.input.keyboard.is-down Phaser.Keyboard.DOWN
    g.camera.y += cam-speed
    if !g.camera.at-limit.y
      s.tile-position.y -= cam-speed

g-render = !->
  g.debug.render-sprite-input-info m, 32, 32

sprite-over = -> console.log \over
sprite-out = -> console.log \out

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
