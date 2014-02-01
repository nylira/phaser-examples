'use strict'

game = new Phaser.Game(800, 600, Phaser.WEBGL, '',
  preload: preload
  create: create
  update: update
)

var bg, filter

function preload
  game.load.image \phaser \../../../phaser/examples/assets/sprites/phaser2.png
  game.load.script \filter \filters/LightBeam.js

function create
  logo = game.add.sprite game.world.center-x, game.world.center-y, \phaser
  logo.anchor.set-to 0.5 0.5

  bg := game.add.sprite 0 0
  bg.width = 800
  bg.height = 600

  filter := game.add.filter \LightBeam 800 600

  filter.alpha = 0.0

  bg.filters = [filter]


function update
  filter.update!
