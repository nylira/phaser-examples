'use strict'

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: preload
  create: create
  update: update
  render: render
)

function preload
  game.load.image \atari \../../../phaser/examples/assets/sprites/atari130xe.png
  game.load.image \mushroom \../../../phaser/examples/assets/sprites/mushroom2.png
  game.load.image \flectrum \../../../phaser/examples/assets/sprites/flectrum.png

var test-group, sprite1, sprite2, sprite3

function create
  game.stage.background-color = \#2d2d2d
  game.world.set-bounds -1000 -1000 2000 2000
  test-group := game.add.group!
  test2!

test1 = ->
  # test 1 2 sprites in world space (seems to work fine with local transform?)
  sprite1 := game.add.sprite -600 200 \atari
  sprite1.name = \atari

  sprite2 := game.add.sprite -100 220 \mushroom

  game.camera.focus-on sprite1
  game.camera.x += 300

  game.input.on-down.add go1, @

test2 = ->
  # 1 sprite in world space (seems to work fine iwth local transform?) and 1 in a group

  sprite1 := test-group.create 0 -150 \atari
  sprite1.name = \atari
  sprite1.body.immovable = true

  sprite2 := game.add.sprite -100 140 \mushroom
  sprite2.name = \mushroom

  sprite3 := game.add.sprite -200 150 \flectrum
  sprite3.name = \tall

  test-group.x = -600
  test-group.y = 200

  game.camera.focus-on sprite2
  game.camera.x -= 300

  game.input.on-down.add go2, @

go1 = ->
  sprite1.body.velocity.x = 100
  sprite2.body.velocity.x = -100

go2 = ->
  sprite2.body.velocity.x = -100

function update
  game.physics.collide sprite1, sprite2, collision-handler, null, @
  # sprite3.angle += 5

collision-handler = (obj1, obj2) ->
  game.stage.background-color = \#992d2d
  console.log "#{obj1.name} collided with #{obj2.name}"

function render
  # game.debug.render-sprite-info sprite1 32 32
  # game.debug.render-sprite-collision sprite1 32 400

  game.debug.render-sprite-coords sprite1, 32, 32
  game.debug.render-sprite-coords sprite2, 300, 32

  game.debug.render-camera-info game.camera, 32, 500

  game.debug.render-sprite-body sprite1
  game.debug.render-sprite-body sprite2
  game.debug.render-sprite-body sprite3

  game.debug.render-group-info test-group, 500, 500
  game.debug.render-pixel test-group.x, test-group.y, 'rgb(255,255,0)'
