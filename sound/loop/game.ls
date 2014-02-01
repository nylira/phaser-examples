'use strict'

game = new Phaser.Game(
  800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
)

function preload()
  game.load.image \spyro \assets/spyro.png
  game.load.audio \squirt [\assets/squit.mp3 \assets\squit.ogg]

function create()
  game.stage.background-color = 'hsl(25,50%,95%)'

  music = game.add.audio \squirt 1 true
  music.play '' 0 1 true

  # load and center an image
  s = game.add.sprite(game.world.center-x, game.world.center-y, \spyro)

  # set anchor to centerpoint
  s.anchor.set-to 0.5 0.5
