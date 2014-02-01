'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

function preload
  game.load.image \beast \assets/pics/shadow_of_the_beast2_karamoon.png
  game.load.image \snot \assets/pics/nslide_snot.png
  game.load.image \atari1 \assets/sprites/atari130xe.png
  game.load.image \sonic \assets/sprites/sonic_havok_sanity.png
  game.load.image \coke \assets/sprites/cokecan.png
  game.load.image \disk \assets/sprites/oz_pov_melting_disk.png

var group1, group2, coke, disk

function create
  # create a background image
  bg = game.add.sprite 0 0 \beast
  bg.scale.set-to 1.5 1.5

  # create a group that will sit above the background image
  group1 := game.add.group!

  # create a group that will sit above group 1
  group2 := game.add.group!

  # create some random sprites and enable them for drag and drop; bring them to top
  for i til 10 by 1
    # ataris show on top
    tmp = game.add.sprite game.world.random-x, game.world.random-y, \atari1
    tmp.name = \atari + i
    tmp.input.start i, true
    tmp.input.enable-drag false, true

    group1.add tmp

    # sonics show below
    tmp = game.add.sprite game.world.random-x, game.world.random-y, \sonic
    tmp.name = \sonic + i
    tmp.input.start 10 + i, true
    tmp.input.enable-drag false, true

    group2.add tmp

  # add two control sprites into each group - these cannot be dragged
  # but should be brought to the top each time
  coke := group1.create 100 100 \coke
  disk := group2.create 400 300 \disk

  # create a foreground image
  snot = game.add.sprite game.world.center-x, game.world.height, \snot
  snot.anchor.set-to 0.5 1

function update
  if game.input.keyboard.just-released Phaser.Keyboard.ONE
    coke.bring-to-top!
    console.log 'coke.bring-to-top!'
  if game.input.keyboard.just-released Phaser.Keyboard.TWO
    disk.bring-to-top!
    console.log 'disk.bring-to-top!'

function render
  game.debug.render-input-info 32 32
