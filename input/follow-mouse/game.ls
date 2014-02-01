'use strict'
{map} = require \prelude-ls
var sprite

game-preload = ->
  game.load.image \image-ball \../../../phaser/examples/assets/sprites/shinyball.png

game-create = ->
  sprite := game.add.sprite game.world.center-x, game.world.center-y, \image-ball

game-update = ->

  # move on mouse hold down
  if game.input.mouse-pointer.is-down

    # 400 is the speed it will move towards the mouse
    game.physics.move-to-pointer sprite, 400

    # if it's overlapping the mouse, don't move
    if Phaser.Rectangle.contains sprite.body, game.input.x, game.input.y
      sprite.body.velocity.set-to 0 0

  else
    sprite.body.velocity.set-to 0 0

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: game-preload, create: game-create, update: game-update)
