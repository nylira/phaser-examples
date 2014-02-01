'use strict'
{map} = require \prelude-ls
var robot, eye, body, left-arm, right-arm, left-leg, right-leg

preload = ->
  g.load.image \eye \assets/sprites/robot/eye.png
  g.load.image \body \assets/sprites/robot/body.png
  g.load.image \arm-l \assets/sprites/robot/arm-l.png
  g.load.image \arm-r \assets/sprites/robot/arm-r.png
  g.load.image \leg-l \assets/sprites/robot/leg-l.png
  g.load.image \leg-r \assets/sprites/robot/leg-r.png

create = ->
  offset-x = - g.world.width / 2
  offset-y = - g.world.height / 2
  
  robot := g.add.group!
  robot.x = g.world.center-x
  robot.y = g.world.center-y

  left-arm  := robot.create offset-x + 90 offset-y + 175 \arm-l
  right-arm := robot.create offset-x + 549 offset-y + 175 \arm-r
  left-leg  := robot.create offset-x + 270 offset-y + 325 \leg-l
  right-leg := robot.create offset-x + 410 offset-y + 325 \leg-r
  body      := robot.create offset-x + 219 offset-y + 32 \body
  eye       := robot.create offset-x + 335 offset-y + 173 \eye
  
  robot.for-each (sprite) ->
    enable-drag sprite

# update = -> robot.angle += 2

render = ->
  g.debug.render-sprite-info left-arm, 32, 30
  g.debug.render-sprite-info right-arm, 32, 180
  g.debug.render-sprite-info left-leg, 32, 325
  g.debug.render-sprite-info right-leg, 32, 470
  g.debug.render-sprite-info body, 450, 30
  g.debug.render-sprite-info eye, 450, 180

  g.debug.render-text 'The robot is a group and every component is a sprite.' 240 580
  g.debug.render-text 'Drag each part to reposition them. ' 288 592

enable-drag = (sprite) ->
  sprite.input.start 0 false true
  sprite.input.enable-drag!

g = new Phaser.Game 800, 600, Phaser.CANVAS, '', preload: preload, create: create, render: render
