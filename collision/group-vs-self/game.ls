'use strict'
var sprites
assets = \../../../phaser/examples/assets/

g-preload = !->
  g.load.spritesheet \spinner assets + \sprites/bluemetal_32x32x4.png 32 32

g-create = !->
  sprites := g.add.group!

  for i til 30
    x = g.rnd.integer-in-range 100 700
    y = g.rnd.integer-in-range 32 200
    s = sprites.create x, y, \spinner
    s.animations.add \spin [0 to 3]
    s.play \spin 20 true
    s.body.velocity.x = g.rnd.integer-in-range -200 200
    s.body.velocity.y = g.rnd.integer-in-range -200 200
    
  sprites.set-all \body.collideWorldBounds true
  sprites.set-all \body.bounce.x 1
  sprites.set-all \body.bounce.y 1
  sprites.set-all \body.minBounceVelocity 0

g-update = !->
  g.physics.collide sprites

g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
