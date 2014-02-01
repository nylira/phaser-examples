'use strict'

game = new Phaser.Game(800, 600, Phaser.WEBGL, '',
  preload: preload
  create: create
)

function preload
  game.load.image \phaser \../../../phaser/examples/assets/sprites/phaser2.png
  game.load.script \filterX \filters/BlurX.js
  game.load.script \filterY \filters/BlurY.js

function create
  logo = game.add.sprite game.world.center-x, game.world.center-y, \phaser
  logo.anchor.set-to 0.5 0.5

  blur-x = game.add.filter \BlurX
  blur-y = game.add.filter \BlurY

  logo.filters = [blur-x, blur-y]
