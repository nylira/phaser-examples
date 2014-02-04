'use strict'
assets = \../../../phaser/examples/assets/

g-preload = !->
g-create = !->
  
  g.rnd.sow [123]
  console.log \A
  console.log g.rnd.integer!
  console.log g.rnd.integer!
  console.log g.rnd.integer!
  console.log g.rnd.integer!
  console.log g.rnd.integer!

  g.rnd.sow [0]
  console.log \B
  console.log g.rnd.integer!
  console.log g.rnd.integer!
  console.log g.rnd.integer!
  console.log g.rnd.integer!
  console.log g.rnd.integer!

  g.rnd.sow [123]
  console.log \C
  console.log g.rnd.integer!
  console.log g.rnd.integer!
  console.log g.rnd.integer!
  console.log g.rnd.integer!
  console.log g.rnd.integer!

g-update = !->
g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
