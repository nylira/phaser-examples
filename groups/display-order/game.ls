'use strict'
{map} = require \prelude-ls
var items, card

preload = ->
  g.load.image \atari1 \../../../phaser/examples/assets/sprites/atari130xe.png
  g.load.image \atari2 \../../../phaser/examples/assets/sprites/atari800xl.png
  g.load.image \card \../../../phaser/examples/assets/sprites/mana_card.png

create = ->
  items := g.add.group!

  items.create 64 100 \atari1
  card := items.create 240 80 \card
  items.create 280 100 \atari2

  g.input.on-tap.add-once remove-card, @

remove-card = ->
  card.kill!
  g.input.on-tap.add-once replace-card, @

replace-card = ->
  items.get-first-dead! |> (.revive!)

g = new Phaser.Game 800, 600, Phaser.AUTO, '', preload: preload, create: create
