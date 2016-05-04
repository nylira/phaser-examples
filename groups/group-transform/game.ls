'use strict'
{map} = require \prelude-ls
var robot, eye, body, left-arm, right-arm, left-leg, right-leg

g-preload = !->
  g.load.image \eye \../../../phaser/examples/assets/sprites/robot/eye.png
  g.load.image \body \../../../phaser/examples/assets/sprites/robot/body.png
  g.load.image \arm-l \../../../phaser/examples/assets/sprites/robot/arm-l.png
  g.load.image \arm-r \../../../phaser/examples/assets/sprites/robot/arm-r.png
  g.load.image \leg-l \../../../phaser/examples/assets/sprites/robot/leg-l.png
  g.load.image \leg-r \../../../phaser/examples/assets/sprites/robot/leg-r.png

g-create = !->
  #offset-x = - g.world.width / 2
  #offset-y = - g.world.height / 2
  offset-x = 0
  offset-y = 0
  
  robot := g.add.group!
  #robot.x = 300
  #robot.y = 300

  left-arm  := robot.create offset-x + 90 offset-y + 175 \arm-l
  right-arm := robot.create offset-x + 549 offset-y + 175 \arm-r
  left-leg  := robot.create offset-x + 270 offset-y + 325 \leg-l
  right-leg := robot.create offset-x + 410 offset-y + 325 \leg-r
  body      := robot.create offset-x + 219 offset-y + 32 \body
  eye       := robot.create offset-x + 335 offset-y + 173 \eye
  
  robot.set-all \inputEnabled true
  robot.call-all \input.enableDrag \input

g-update = !->
  #robot.angle += 2

g-render = !->

  g.debug.render-text 'The robot is a group and every component is a sprite.' 240 580
  g.debug.render-text 'Drag each part to reposition them. ' 288 592

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
