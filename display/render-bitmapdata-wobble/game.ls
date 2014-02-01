'use strict'

game = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
)

function preload
  game.load.image \mushroom \../../../phaser/examples/assets/sprites/mushroom2.png

var mushroom, texture

function create
  texture := game.add.render-texture \mousetrail 800 600

  mushroom := game.add.sprite 0 0 \mushroom
  mushroom.visible = false
  mushroom.anchor.set-to 0.5 0.5

  game.add.sprite 0 0 texture

function update
  texture.render mushroom, game.input.active-pointer.position, false
