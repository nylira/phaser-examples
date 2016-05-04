'use strict'
assets = \../../../phaser/examples/assets/
var text

g-preload = !->
  # Phaser can load text files.
  #
  #  It does this using an XMLHttpRequest
  #
  #  If loading a file from outside of the domain in which the game is running
  #  a 'Access-Control-Allow-Origin' header must be present on the server.
  #  No parsing of the text file is performed, it's literally just the raw data.
  g.load.text \html \http://phaser.io


g-create = !->
  g.stage.background-color = \#0072bc

  html = g.cache.get-text \html
  text := html.split \\n

g-update = !->

g-render = !->
  for i til 30
    g.debug.render-text text[i], 32, i * 20

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
