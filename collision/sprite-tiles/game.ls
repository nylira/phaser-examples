'use strict'

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

function preload
  g.load.spritesheet \tiles \../../../phaser/examples/assets/tilemaps/tiles/platformer_tiles.png 16 16
  g.load.image \carrot \../../../phaser/examples/assets/sprites/carrot.png

var tiles, sprite

function create
  g.stage.background-color = \#2d2d2d

  tiles := g.add.group!
  for i til 40
    tile = tiles.create 100 + i*16, 300, \tiles, 4
    tile.body.immovable = true

  sprite := g.add.sprite 300 150 \carrot
  sprite.name = \mushroom
  sprite.body.collide-world-bounds = true
  sprite.body.velocity.x = 40
  sprite.body.velocity.y = 120
  sprite.body.bounce.set-to 1 1

  g.input.on-down.add carry-on, @

carry-on = ->
  g.paused = false
  console.log \nopause!

function update
  g.physics.collide sprite, tiles, collision-handler, null, @

collision-handler = (sprite, tile)->
  tile.alpha = 0.5

  console.log \---------------------------------------------
  console.log tile.body

  g.paused = true

function render
  g.debug.render-physics-body sprite.body
