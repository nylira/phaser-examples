'use strict'
{map} = require \prelude-ls
var enemies

preload = ->
  g.load.image \baddie \assets/sprites/space-baddie.png
  g.load.spritesheet \button \assets/buttons/baddie-buttons.png 224 70

create = ->
  enemies := g.add.group!

  for i til 8
    x = 360 + Math.floor Math.random! * 200
    y = 120 + Math.floor Math.random! * 200
    enemies.create x, y, \baddie

  g.add.button 16, 50, \button, create-baddie, @, 0, 0, 0
  g.add.button 16, 130, \button, kill-baddie, @, 1, 1, 1

kill-baddie = ->
  baddie = enemies.get-first-alive!
  if baddie
    tween = g.add.tween baddie 
      .to y: baddie.y + 50, alpha: 0.5, 250, Phaser.Easing.Elastic.Out, true, 0, 0, true
    tween.onComplete.add kill-it, @

kill-it = (sprite) ->
  sprite.kill!

create-baddie = ->
  enemy = enemies.get-first-exists false
  if enemy
    enemy.revive!

    g.add.tween enemy 
    .to y: enemy.y - 50, alpha: 1, 250, Phaser.Easing.Elastic.Out, true, 0, 0, true

g = new Phaser.Game 800, 600, Phaser.AUTO, '', preload: preload, create: create
