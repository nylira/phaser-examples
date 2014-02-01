'use strict'
#{map} = require \prelude-ls
var key-one, key-two, key-three

game-preload = ->
  game.load.image \image-phaser \assets/sprites/phaser-dude.png
  game.load.image \image-logo \assets/sprites/phaser_tiny.png
  game.load.image \image-pineapple \assets/sprites/pineapple.png

game-create = ->
  game.stage.background-color = \#736357
  
  key-one := game.input.keyboard.add-key Phaser.Keyboard.ONE
  key-one.on-down.add add-phaser-dude, @

  key-two := game.input.keyboard.add-key Phaser.Keyboard.TWO
  key-two.on-down.add add-phaser-logo, @
  
  key-three := game.input.keyboard.add-key Phaser.Keyboard.THREE
  key-three.on-down.add add-pineapple, @

add-phaser-dude = ->
  game.add.sprite game.world.random-x, game.world.random-y, \image-phaser
  
add-phaser-logo = ->
  game.add.sprite game.world.random-x, game.world.random-y, \image-logo

add-pineapple = ->
  game.add.sprite game.world.random-x, game.world.random-y, \image-pineapple

game = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: game-preload, create: game-create)
