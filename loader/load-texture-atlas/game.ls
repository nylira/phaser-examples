'use strict'
assets = \../../../phaser/examples/assets/
var octopus

g-preload = !->
  # Phaser can load teture atlas files that use JSON hash || JSON array formats
  #
  # As with all load operations the first parameter is a unique key, which
  # must be unique between all image files.
  #
  # Next is the texture atlas itself, in this case seacreatures.png
  #
  # Finally is the path to the JSON file that goes with the atlas.
  g.load.atlas \seacreatures assets+\sprites/seacreatures_json.png assets+\sprites/seacreatures_json.json

  # Note that the JSON file should be saved wit UTF-8 encoding or some
  # browsers (like Firefox) won't load it.
  
  g.load.image \undersea assets+\pics/undersea.jpg
  g.load.image \coral assets+\pics/seabed.png

g-create = !->
  g.add.sprite 0 0 \undersea

  octopus := g.add.sprite 330 100 \seacreatures
  octopus.animations.add \swim, Phaser.Animation.generate-frame-names(\octopus 0 24 '' 4), 30, true
  octopus.animations.play \swim

  g.add.tween octopus
  .to y: 250, 4000, Phaser.Easing.Quadratic.InOut, true, 0, 10000, true

  g.add.sprite 0 466 \coral

g-update = !->

g-render = !->
  for i til 30
    g.debug.render-text text[i], 32, i * 20

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
