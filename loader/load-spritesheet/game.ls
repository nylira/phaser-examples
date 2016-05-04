'use strict'
assets = \../../../phaser/examples/assets/

g-preload = !->
  # A sprite sheet is for loading classic "old school" style animations, where
  # each fram uses the exact same size frame and there is no configuration file.
  #
  # This is different to a texture atlas, in which the frames are usually
  # variable in size and come with a json or xml file that describes their
  # structure. Sometimes a texture atlas is called a "sprite sheet" but that
  # isn't the terminology Phaser uses.
  #
  # To add a sprite sheet to the loader, use the following:
  g.load.spritesheet \unique-key assets+\sprites/metalslug_mummy37x45.png 37 45 18

g-create = !->
  sprite = g.add.sprite 0 0 \unique-key
  sprite.animations.add \walk
  sprite.animations.play \walk 50 true

g-update = !->

g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
