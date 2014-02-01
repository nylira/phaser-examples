'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
)

var sprite, bullets, veggies, bullet, laser-sound, splat-sound, score-text
bullet-time = 0
score = 0

function preload
  game.load.image \phaser \assets/phaser-dude.png
  game.load.image \bullet \assets/bullet0.png
  game.load.audio \laser \assets/laser1.mp3
  game.load.audio \splat \assets/splat1.mp3
  game.load.spritesheet \veggies \assets/fruitnveg32wh37.png 32 32

function create
  game.stage.background-color = \#2d2d2d

  veggies := game.add.group!

  for i til 50
    c = veggies.create(
      game.world.random-x,
      Math.random! * 500,
      \veggies,
      game.rnd.integer-in-range 0 36
    )

    c.name = "veg#i"
    c.body.immovable = true

  bullets := game.add.group!

  for i til 10
    b = bullets.create 0 0 \bullet
    b.exists = false
    b.visible = false
    b.events.on-out-of-bounds.add reset-bullet, @

  sprite := game.add.sprite 400 550 \phaser
  # make sure you can't push the sprite outside of the world
  sprite.body.collide-world-bounds = true

  laser-sound := game.add.audio \laser 1 true
  splat-sound := game.add.audio \splat 1 true

  score-text := game.add.text 16 16 "Score: 0" {font: "24px Arial", fill: \#ffffff}

  game.input.keyboard.add-key-capture Phaser.Keyboard.LEFT, Phaser.Keyboard.RIGHT, Phaser.Keyboard.SPACEBAR

function update
  sprite.body.velocity.x = 0
  sprite.body.velocity.y = 0

  if game.input.keyboard.is-down Phaser.Keyboard.LEFT
    sprite.body.velocity.x = -200
  else if game.input.keyboard.is-down Phaser.Keyboard.RIGHT
    sprite.body.velocity.x = 200

  if game.input.keyboard.is-down Phaser.Keyboard.SPACEBAR
    fire-bullet!

  game.physics.collide bullets, veggies, collisionHandler, null, @

fire-bullet = ->
  if game.time.now > bullet-time
    bullet := bullets.get-first-exists false

    if bullet
      bullet.reset sprite.x + 6, sprite.y - 8
      bullet.body.velocity.y = -300
      bullet-time := game.time.now + 250
      # game, key, volume, loop?
      laser-sound.play '' 0 0.05 false

reset-bullet = (bullet) ->
  bullet.kill!

collision-handler = (bullet, veggie) ->
  bullet.kill!
  veggie.kill!
  splat-sound.play '' 0 0.05 false
  score += 1
  score-text.set-text "Score: #score"
