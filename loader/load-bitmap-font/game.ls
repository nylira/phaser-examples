'use strict'
assets = \../../../phaser/examples/assets/
var text

g-preload = !->
  # Phaser can load Bitmap Fonts.

  # As with all load operations, the first parameter is a unique key, which must be unique between all image files.
  # Next is the bitmap font file itself, in this case desyrel.png
  # Finally is the path to the XML file that goes with the font

  g.load.bitmap-font \desyrel assets+\fonts/desyrel.png assets+\fonts/desyrel.xml

  # Note that the XML file should be saved with UTF-8 encoding or some browsers (like Firefox) won't load it.
  #
  # There are various tools that can create Bitmap Fonts and the XML file needed.
  # 
  # On Windows you can use the free BMFont: http://www.anglecode.com/products/bmfont/
  #
  # On OS X we recommend Glyph Designer: http://www.71squared.com/en/glyphdesigner

g-create = !->
  g.stage.background-color = \#0072bc
  text := g.add.bitmap-text 200 100 'Bitmap Fonts!' font: '64px Desyrel' align: \center

g-update = !->
  text.set-text 'Bitmap Fonts!\nx: ' + Math.round(g.input.x) + ' y: ' + Math.round(g.input.y)

g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
