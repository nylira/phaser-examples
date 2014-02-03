'use strict'
{map} = require \prelude-ls

var desert-map, tileset, layer, player, group, cursors
old-y = 0

preload = ->
  g.load.image \phaser \../../../phaser/examples/assets/sprites/phaser-dude.png
  g.load.tilemap(\desert, \../../../phaser/examples/assets/tilemaps/maps/depthsort.json, null, Phaser.Tilemap.TILED_JSON)
  g.load.image \ground_1x1 \../../../phaser/examples/assets/tilemaps/tiles/ground_1x1.png
  g.load.spritesheet \trees \../../../phaser/examples/assets/tilemaps/tiles/walls_1x2.png 32 64

create = ->
  desert-map = g.add.tilemap \desert
  desert-map.add-tileset-image \ground_1x1
  layer = desert-map.create-layer 'Tile Layer 1'
  layer.resize-world!                    # resize world to tilemap dimensions

  group := g.add.group!
  player := group.create 300 200 \phaser
  #g.camera.follow player                 # basic camera follow

  map create-trees, [0 til 50]           # create trees in group

  cursors := g.input.keyboard.create-cursor-keys!

update = ->
  player.body.velocity.x = 0
  player.body.velocity.y = 0

  if cursors.left.is-down
    player.body.velocity.x = -200
  else if cursors.right.is-down
    player.body.velocity.x = 200

  if cursors.up.is-down
    player.body.velocity.y = -200
  else if cursors.down.is-down
    player.body.velocity.y = 200

  if player.y !== old-y
    # Group.sort! is an expensive operation
    # You really want to minimize how often it is called
    # So this little check helps at least, but try to do even less
    group.sort!
    old-y = player.y


create-trees = (i) ->
  x = g.math.snap-to g.world.random-x, 32
  y = g.math.snap-to g.world.random-y, 32
  group.create x, y, \trees, g.rnd.integer-in-range 0 8

g = new Phaser.Game 800, 600, Phaser.CANVAS, '', preload: preload, create: create, update: update
