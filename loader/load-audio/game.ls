'use strict'
assets = \../../../phaser/examples/assets/
var music

g-preload = !->
  # To load an audio file use the following structure
  # As with all load operations the first parameter is a unique key, which must be unique between all audio files.
  #
  # The second parameter is an array containing the same audio file but in different formats.
  # In this example, the music is provided as an mp3 and an ogg (Firefox will want the ogg for example)
  # 
  # The load works by checking if the browser can support the first file type in the list (mp3 in this case). If it can, it loads it, otherwise
  # it moves to the next file in the list (the ogg). If it can't load any of them, the file will error.

  g.load.audio \boden [assets+\audio/bodenstaendig_2000_in_rock_4bit.mp3 assets+\audio/bodenstaendig_2000_in_rock_4bit.ogg]

  # If you know you only need to load 1 type of audio file, you can pass in a string instead of an array.

g-create = !->
  g.stage.background-color = \#182d3b

  music := g.sound.play \boden

g-update = !->

g-render = !->
  g.debug.render-sound-info music, 32, 32
  if music.is-decoding
    g.debug.render-text "Decoding MP3 ..." 32 200

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
