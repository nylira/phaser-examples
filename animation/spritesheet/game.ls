'use strict'

game = new Phaser.Game(
  800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
)

function preload()
  # name               = 'mummy'
  # path               = 'assets/metalslug_mummy37x45.png'
  # width of frame     = 37
  # height of frame    = 45
  # number of frames   = 18
  game.load.spritesheet \mummy \assets/metalslug_mummy37x45.png 37 45 18

function create()
  mummy = game.add.sprite 300 200 \mummy

  # because there aren't any other pararms, this will make an
  # animation from all available frames
  mummy.animations.add \walk

  # this starts the animation, sets the FPS, and true = loop
  mummy.animations.play \walk 20 true

