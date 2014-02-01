'use strict'
var sprite, bullets, veggies, bullet, laser-sound, splat-sound, score-text
bullet-time = 0
score = 0

g-preload = !->
  g.load.image \phaser \../../../phaser/examples/assets/sprites/phaser-dude.png
  g.load.image \bullet \../../../phaser/examples/assets/misc/bullet0.png
  g.load.audio \laser \../../../phaser/examples/assets/audio/SoundEffects/lazer.wav
  g.load.audio \splat \../../../phaser/examples/assets/audio/SoundEffects/explode1.wav
  g.load.spritesheet \veggies \../../../phaser/examples/assets/sprites/fruitnveg32wh37.png 32 32

g-create = !->
  g.stage.background-color = \#2d2d2d

  veggies := g.add.group!

  for i til 50
    c = veggies.create(
      g.world.random-x,
      Math.random! * 500,
      \veggies,
      g.rnd.integer-in-range 0 36
    )

    c.name = "veg#i"
    c.body.immovable = true

  bullets := g.add.group!

  for i til 10
    b = bullets.create 0 0 \bullet
    b.exists = false
    b.visible = false
    b.events.on-out-of-bounds.add reset-bullet, @

  sprite := g.add.sprite 400 550 \phaser
  # make sure you can't push the sprite outside of the world
  sprite.body.collide-world-bounds = true

  laser-sound := g.add.audio \laser 1 true
  splat-sound := g.add.audio \splat 1 true

  score-text := g.add.text 16 16 "Score: 0" {font: "24px Arial", fill: \#ffffff}

  g.input.keyboard.add-key-capture Phaser.Keyboard.LEFT, Phaser.Keyboard.RIGHT, Phaser.Keyboard.SPACEBAR

g-update = !->
  sprite.body.velocity.x = 0
  sprite.body.velocity.y = 0

  if g.input.keyboard.is-down Phaser.Keyboard.LEFT
    sprite.body.velocity.x = -200
  else if g.input.keyboard.is-down Phaser.Keyboard.RIGHT
    sprite.body.velocity.x = 200

  if g.input.keyboard.is-down Phaser.Keyboard.SPACEBAR
    fire-bullet!

  g.physics.collide bullets, veggies, collisionHandler, null, @

fire-bullet = ->
  if g.time.now > bullet-time
    bullet := bullets.get-first-exists false

    if bullet
      bullet.reset sprite.x + 6, sprite.y - 8
      bullet.body.velocity.y = -300
      bullet-time := g.time.now + 250
      # g, key, volume, loop?
      laser-sound.play '' 0 0.05 false

reset-bullet = (bullet) ->
  bullet.kill!

collision-handler = (bullet, veggie) ->
  bullet.kill!
  veggie.kill!
  splat-sound.play '' 0 0.05 false
  score += 1
  score-text.set-text "Score: #score"

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update)
