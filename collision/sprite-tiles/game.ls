'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

function preload
  game.load.spritesheet \tiles \../../../phaser/examples/assets/tiles/platformer_tiles.png 16 16
  game.load.image \carrot \../../../phaser/examples/assets/sprites/carrot.png

var tiles, sprite

function create
  game.stage.background-color = \#2d2d2d

  tiles := game.add.group!
  for i til 40
    tile = tiles.create 100 + i*16, 300, \tiles, 4
    tile.body.immovable = true

  sprite := game.add.sprite 300 150 \carrot
  sprite.name = \mushroom
  sprite.body.collide-world-bounds = true
  sprite.body.velocity.x = 40
  sprite.body.velocity.y = 120
  sprite.body.bounce.set-to 1 1

  game.input.on-down.add carry-on, @

carry-on = ->
  game.paused = false

function update
  game.physics.collide sprite, tiles, collision-handler, null, @

collision-handler = (sprite, tile)->
  tile.alpha = 0.5

  console.log \---------------------------------------------
  console.log tile.body

  game.paused = true

function render
  game.debug.render-sprite-body sprite

