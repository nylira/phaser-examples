'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

function preload
  game.load.image \phaser \../../../phaser/examples/assets/sprites/phaser-dude.png
  game.load.spritesheet \veggies \../../../phaser/examples/assets/sprites/fruitnveg32wh37.png 32 32

var sprite, all-veggies

function create
  game.stage.background-color = \#222222

  sprite := game.add.sprite 32 200 \phaser
  sprite.name = \phaser-dude

  all-veggies := game.add.group!

  for i til 50
    vegetable = all-veggies.create(
      100 + Math.random() * 700,
      game.world.random-y,
      \veggies,
      game.rnd.integer-in-range 0 36    # choose a random vegetable
    )
    vegetable.name = "veg#i"
    vegetable.body.immovable = true

  for i til 20
    chili = all-veggies.create(
      100 + Math.random() * 700,
      game.world.random-y,
      \veggies,
      17                                # choose a random vegetable
    )
    chili.name = "chili#i"
    chili.body.immovable = true

    game.input.keyboard.add-key-capture(
      Phaser.Keyboard.LEFT
      Phaser.Keyboard.RIGHT
      Phaser.Keyboard.UP
      Phaser.Keyboard.DOWN
    )

function update
  sprite.body.velocity.x = 0
  sprite.body.velocity.y = 0

  if game.input.keyboard.is-down Phaser.Keyboard.LEFT
    sprite.body.velocity.x = -200
  else if game.input.keyboard.is-down Phaser.Keyboard.RIGHT
    sprite.body.velocity.x = 200

  if game.input.keyboard.is-down Phaser.Keyboard.UP
    sprite.body.velocity.y = -200
  else if game.input.keyboard.is-down Phaser.Keyboard.DOWN
    sprite.body.velocity.y = 200

  game.physics.collide sprite, all-veggies, collisionHandler, null, @

collisionHandler = (obj1, obj2)->
  console.log 'Hit', obj2.name

  # if the object is a chili pepper
  if obj2.frame == 17
    obj2.kill!

function render
  game.debug.render-quad-tree game.physics.quad-tree

