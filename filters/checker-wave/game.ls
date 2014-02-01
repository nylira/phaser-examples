'use strict'

game = new Phaser.Game(800, 600, Phaser.WEBGL, '',
  preload: preload
  create: create
  update: update
)

var bg, filter

function preload
  game.load.image \s \../../../phaser/examples/assets/pics/undersea.jpg
  game.load.image \phaser \../../../phaser/examples/assets/sprites/phaser.png
  game.load.script \filter \filters/CheckerWave.js

function create
  game.add.sprite 0 0 \s

  bg := game.add.sprite 0 0
  bg.width = 800
  bg.height = 600

  filter := game.add.filter \CheckerWave 800 600
  filter.alpha = 0.2

  bg.filters = [filter]

  logo = game.add.sprite game.world.center-x, 100, \phaser
  logo.anchor.set-to 0.5 0.5

function update
  filter.update!
