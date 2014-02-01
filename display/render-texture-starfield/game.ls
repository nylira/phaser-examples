'use strict'

game = new Phaser.Game(800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
)

function preload
  game.load.image \star \../../../phaser/examples/assets/sprites/bullet.png

var star, texture1, texture2, texture3
stars = []

stage-ttl = 200
stage-one = Math.floor stage-ttl * 1/3
stage-two = Math.floor stage-ttl * 2/3

function create

  star := game.add.sprite 0 0 \star
  star.visible = false

  texture1 := game.add.render-texture \texture1 800 600
  texture2 := game.add.render-texture \texture2 800 600
  texture3 := game.add.render-texture \texture3 800 600
  
  game.add.sprite 0, 0, texture1
  game.add.sprite 0, 0, texture2
  game.add.sprite 0, 0, texture3

  t = texture1
  s = 4

  for i til stage-ttl
    # after 100 stars we ramp up the speed and swap to next texture
    if i == stage-one
      s = 6
      t = texture2
    else if i == stage-two
      s = 10
      t = texture3

    stars.push(
      x: game.world.random-x, y: game.world.random-y, speed: s, texture: t
    )

function update
  for i til stage-ttl
    stars[i].y += stars[i].speed

    if stars[i].y > 600
      stars[i].x = game.world.random-x
      stars[i].y = -32

    if i == 0 || i == stage-one || i == stage-two
      # if it's the first star of the layer then we clear the texture
      stars[i].texture.render-x-y star, stars[i].x, stars[i].y, true
    else
      # otherwise just draw the star sprite where we need it
      stars[i].texture.render-x-y star, stars[i].x, stars[i].y, false
