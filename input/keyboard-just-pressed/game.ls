'use strict'
#{map} = require \prelude-ls
var sprite, bullet, bullets
bullet-time = 0

g-preload = !->
  game.load.image \image-phaser \assets/sprites/phaser-dude.png
  game.load.image \image-bullet \assets/misc/bullet0.png

g-create = !->
  game.stage.background-color = \#2d2d2d
  
  bullets := game.add.group!
  bullets.create-multiple 10 \image-bullet
  bullets.call-all \events.onOutOfBounds.add, \events.onOutOfBounds, bullet-reset, @

  sprite := game.add.sprite 400 550 \image-phaser

  # stop the following keys form propagating up to the browser
  game.input.keyboard.add-key-capture([
    Phaser.Keyboard.LEFT
    Phaser.Keyboard.RIGHT
    Phaser.Keyboard.SPACEBAR
  ])

g-update = !->
  sprite.body.velocity.x = 0
  sprite.body.velocity.y = 0

  if game.input.keyboard.is-down Phaser.Keyboard.LEFT
    sprite.body.velocity.x = -200
  else if game.input.keyboard.is-down Phaser.Keyboard.RIGHT
    sprite.body.velocity.x = 200

  if game.input.keyboard.is-down Phaser.Keyboard.SPACEBAR
    bullet-fire 3

bullet-fire = (rounds-per-second)->
  if game.time.now > bullet-time
    bullet := bullets.get-first-exists false

    if bullet
      bullet.reset sprite.x + 6, sprite.y - 8
      bullet.body.velocity.y = -300
      bullet-time := game.time.now + 1000ms / rounds-per-second

bullet-reset = (bullet) ->
  bullet.kill!

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update)
