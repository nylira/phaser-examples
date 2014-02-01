'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

function preload
  game.load.image \atari \assets/sprites/atari130xe.png

function create
  sprite = game.add.sprite 0 0 \atari

  game.stage.background-color = \#e3ed49

  game.input.on-down.add gofull, @

gofull = ->
  game.stage.scale.start-full-screen!

function update
  if document.get-elements-by-tag-name('body')[0].scroll-top > 1000
    game.stage.background-color = \#87ff55
    window.scroll-to 0 0

function render
  game.debug.render-text 'Tap to go fullscreen' 32 150
