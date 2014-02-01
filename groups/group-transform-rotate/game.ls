'use strict'
{map} = require \prelude-ls
var robot

preload = ->
  g.load.image \eye \assets/sprites/robot/eye.png
  g.load.image \body \assets/sprites/robot/body.png
  g.load.image \arm-l \assets/sprites/robot/arm-l.png
  g.load.image \arm-r \assets/sprites/robot/arm-r.png
  g.load.image \leg-l \assets/sprites/robot/leg-l.png
  g.load.image \leg-r \assets/sprites/robot/leg-r.png

create = ->
  gcx = g.world.center-x
  gcy = g.world.center-y
  offset-x = - g.world.width / 2
  offset-y = - g.world.height / 2
  
  robot := g.add.group!
  robot.x = gcx
  robot.y = gcy

  robot.create offset-x + 90 offset-y + 175 \arm-l
  robot.create offset-x + 549 offset-y + 175 \arm-r
  robot.create offset-x + 270 offset-y + 325 \leg-l
  robot.create offset-x + 410 offset-y + 325 \leg-r
  robot.create offset-x + 219 offset-y + 32 \body
  robot.create offset-x + 335 offset-y + 173 \eye

update = ->
  robot.angle += 2

g = new Phaser.Game 800, 600, Phaser.CANVAS, '', preload: preload, create: create, update: update
