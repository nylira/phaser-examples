'use strict'

game = new Phaser.Game(800, 600, Phaser.WEBGL, '',
  preload: preload
  create: create
  update: update
)

var bg, filter

function preload
  game.load.image \phaser \assets/sprites/phaser2.png
  game.load.image \texture \assets/textures/ooze.png
  game.load.script \filter \filters/Tunnel.js

function create
  bg := game.add.sprite 0 0 \texture
  bg.width = 800
  bg.height = 600

  filter := game.add.filter \Tunnel 800 600 bg.texture
  filter.origin = 1.0
  
  bg.filters = [filter]

  logo = game.add.sprite game.world.center-x, game.world.center-y, \phaser
  logo.anchor.set-to 0.5 0.5


function update
  filter.update!
  filter.origin += 0.001
