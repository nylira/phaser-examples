'use strict'

game = new Phaser.Game(
  800, 600, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
)

function preload()
  game.load.image \background \../../../phaser/examples/assets/misc/starfield.jpg
  game.load.image \ufo \../../../phaser/examples/assets/sprites/space-baddie.png
  game.load.image \player \../../../phaser/examples/assets/sprites/phaser-dude.png

var player, fixed, cursors
var enemies
var bg1
var bg2

function create()

  bg1 := game.add.tile-sprite 0 0 2048 2048 \background

  game.world.set-bounds 0 0 1400 1400

  enemies := game.add.group!
  for i from 0 til 100 by 1
    enemy = game.add.sprite game.world.random-x, game.world.random-y, \ufo
    enemy.anchor.set-to 0.5 0.5
    enemies.add(enemy)

  fixed := game.add.sprite 300 320 \player
  fixed.fixed-to-camera = true
  fixed.camera-offset.y = 300

  player := game.add.sprite 150 320 \player
  cursors := game.input.keyboard.create-cursor-keys!

  game.camera.follow player

function update()
  # reset player movement to 0
  player.body.velocity.set-to 0 0

  # up/down movement
  if cursors.up.is-down
    player.body.velocity.y = -200
  else if cursors.down.is-down
    player.body.velocity.y = 200

  # left/right movement
  if cursors.left.is-down
    player.body.velocity.x = -200
  else if cursors.right.is-down
    player.body.velocity.x = 200
