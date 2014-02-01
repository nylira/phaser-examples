'use strict'

game = new Phaser.Game(
  800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

var music
var alien

function preload()
  game.load.image \alien \../../../phaser/examples/assets/ra_dont_crack_under_pressure.png
  game.load.audio \boden [\../../../phaser/examples/assets/bodenstaendig_2000_in_rock_4bit.mp3 \../../../phaser/examples/assets/bodenstaendig_2000_in_rock_4bit.ogg]

function create()
  game.stage.background-color = 'hsl(210,50%,25%)'
  game.input.touch.prevent-default = false

  music := game.add.audio \boden 1 true
  music.play '' 0 1 true

  # load and center an image
  alien := game.add.sprite(game.world.center-x, game.world.center-y, \alien)
  alien.anchor.set-to 0.5 0.5

  game.input.on-down.add(change-volume, this)

change-volume = (pointer) ->
  if pointer.y < 300
    music.volume += 0.1
  else
    music.volume -= 0.1

function update()
  alien.rotation += 0.01

function render()
  game.debug.render-sound-info(music, 20, 32)

