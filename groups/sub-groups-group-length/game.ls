'use strict'
{map} = require \prelude-ls
var grp-friends, grp-enemies, grp-normal-mobs, grp-purple-mobs

preload = ->
  g.load.image \sprite-ufo \assets/sprites/ufo.png
  g.load.image \sprite-normal-mob \assets/sprites/space-baddie.png
  g.load.image \sprite-purple-mob \assets/sprites/space-baddie-purple.png

create = ->
  grp-friends := g.add.group!
  grp-enemies := g.add.group!
  grp-normal-mobs := g.add.group!
  grp-purple-mobs := g.add.group!
  
  # add both mob grps to enemies grp with PIXI's _container
  grp-enemies.add grp-normal-mobs._container
  grp-enemies.add grp-purple-mobs._container

  grp-friends.create 200 240 \sprite-ufo

  map create-mob, [0 til 16]

  g.input.on-tap.add create-mob, @

render = ->
  g.debug.render-text 'Tap screen or click to create new baddies' 16 24
  g.debug.render-text(
    "grp-enemies: #{grp-enemies.length} (actually #{grp-enemies.length} groups)",
    16, 48)
  g.debug.render-text "grp-normal-mobs: #{grp-normal-mobs.length}" 16 60
  g.debug.render-text "grp-purple-mobs: #{grp-purple-mobs.length}" 16 72
  g.debug.render-text "grp-friends:: #{grp-friends.length}" 16 96

create-mob = ->
  x = 360 + Math.random! * 200
  y = 120 + Math.random! * 200
  if Math.random! > 0.5
    grp-normal-mobs.create x, y, \sprite-normal-mob
  else
    grp-purple-mobs.create x, y, \sprite-purple-mob

g = new Phaser.Game 800, 600, Phaser.CANVAS, '', preload: preload, create: create, render: render
