'use strict'
var sprite, group, cursors

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
)

function preload
  g.load.image \phaser \../../../phaser/examples/assets/sprites/phaser-dude.png
  g.load.spritesheet \veggies \../../../phaser/examples/assets/sprites/fruitnveg32wh37.png 32 32


function create
  g.stage.background-color = \#2d2d3d

  sprite := g.add.sprite 32 200 \phaser
  sprite.name = \phaser-dude

  group := g.add.group!

  for i til 50
    x = 100 + Math.random! * 700
    y = g.world.random-y
    c = group.create x, y, \veggies, g.rnd.integer-in-range 0 36
    c.name = "veg#i"
    c.body.immovable = true

    cursors := g.input.keyboard.create-cursor-keys!

function update
  g.physics.collide sprite, group, collision-handler, null, @
  #g.physics.collide group, group

  sprite.body.velocity.x = 0
  sprite.body.velocity.y = 0

  if cursors.left.is-down
    sprite.body.velocity.x = -200
  else if cursors.right.is-down
    sprite.body.velocity.x = 200

  if cursors.up.is-down
    sprite.body.velocity.y = -200
  else if cursors.down.is-down
    sprite.body.velocity.y = 200

collisionHandler = (obj1, obj2)->
  # If the player collides with the chilis then they get eaten :)
  # The chili frame ID is 17
  if obj2.frame == 17 => obj2.kill!
