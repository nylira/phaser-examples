'use strict'
#{map} = require \prelude-ls
var chick, car, mech, robot, cop

g-preload = !->
  g.load.image \img-bunny \../../../phaser/examples/assets/sprites/bunny.png
  g.load.atlas \atlas \../../../phaser/examples/assets/pics/texturepacker_test.png \../../../phaser/examples/assets/pics/texturepacker_test.json

g-create = !->
  g.stage.background-color = \#404040

  add-sprite 64 64 \atlas \budbrain_chick.png
  add-sprite 600 64 \atlas \ladycop.png
  add-sprite 50 300 \atlas \robot.png
  add-sprite 100 400 \atlas \supercars_parsec.png
  add-sprite 250 100 \atlas \titan_mech.png

add-sprite = (x, y, atlas-name, frame-name) ->
  sprite = g.add.sprite x, y, atlas-name
  sprite.frame-name = frame-name
  sprite.input-enabled = true
  sprite.input.pixel-perfect = true
  sprite.input.use-hand-cursor = true

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create)
