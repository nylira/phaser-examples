'use strict'

game = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
)

function preload
  game.load.image \ball \assets/sprites/pangball.png

var ball, texture

function create
  texture := game.add.render-texture \mousetrail 800 600

  ball := game.add.sprite 0 0 \ball
  ball.visible = false
  ball.anchor.set-to 0.5 0.5

  game.add.sprite 0, 0, texture

function update
  texture.render-x-y ball, game.input.active-pointer.x, game.input.active-pointer.y, false
  texture.render-x-y ball, game.input.active-pointer.x, 600 - game.input.active-pointer.y, false

