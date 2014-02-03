'use strict'

game = new Phaser.Game(
  800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
)

function preload()
  game.load.image \spyro \../../../phaser/examples/assets/pics/spyro.png
  game.load.audio \squirt [\../../../phaser/examples/assets/audio/SoundEffects/squit.mp3 \../../../phaser/examples/assets/audio/SoundEffects/squit.ogg]

function create()
  game.stage.background-color = 'hsl(25,50%,95%)'

  music = game.add.audio \squirt 1 true
  music.play '' 0 1 true

  # load and center an image
  s = game.add.sprite(game.world.center-x, game.world.center-y, \spyro)

  # set anchor to centerpoint
  s.anchor.set-to 0.5 0.5
