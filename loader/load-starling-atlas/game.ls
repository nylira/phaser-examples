'use strict'
assets = \../../../phaser/examples/assets/
var jellyfish

g-preload = !->
  # Phaser can load texture atlas files that use the Starling XML file format.
  #
  # As with all load operations the first parameter is a unique key, which
  # must be unique between all the image files.
  #
  # Next is the texture atlas itself, in this case seacreatures.png
  # Finally is the path to the XML file that goes with the atlas.
  g.load.atlas-XML \seacreatures assets+\sprites/seacreatures.png assets+\sprites/seacreatures.xml

  # Note that the XML file should be saved with UTF-8 encoding or some browsers
  # (such as Firefox) won't load it
  
  # These are just a few images to use in our underwater scene.
  g.load.image \undersea assets+\pics/undersea.jpg
  g.load.image \coral assets+\pics/seabed.png

g-create = !->
  g.add.sprite 0 0 \undersea

  jellyfish := g.add.sprite 330 100 \seacreatures
  jellyfish.animations.add \swim, Phaser.Animation.generate-frame-names(\greenJellyfish 0 39 '' 4), 30, true
  jellyfish.animations.play \swim

  g.add.sprite 0 466 \coral

  g.add.tween jellyfish
  .to y: 250, 4000, Phaser.Easing.Quadratic.InOut true 0 10000 true

g-update = !->

g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
