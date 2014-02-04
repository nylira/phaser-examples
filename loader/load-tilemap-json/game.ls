'use strict'
assets = \../../../phaser/examples/assets/
var map, layer

g-preload = !->
  # Tilemaps are split into two parts: The actual map data (usually stored
  # in a CSV or JSON file) and the tileset(s) used to render the map.
  #
  # Here we'll load the tilemap data. The first parameter is a unique key for
  # the map data.
  #
  # The second is a URL to the JSON file the map data is stored in. This is
  # actually optional, you can pass the JSON object as the third parameter
  # if you already have it loaded (maybe via a 3rd party source or pre-
  # generated. In which case pass 'null' as the URL and the JSON object as
  # the third parameter.
  #
  # The final parameter tells Phaser the format of the map data. In this case
  # it's a JSON file exported from the Tiled map editor.
  # This could be Phaser.Tilemap.CSV too.

  g.load.tilemap \mario, assets+\tilemaps/maps/super_mario.json, null, Phaser.Tilemap.TILED_JSON

  # Next we load the tileset. This is just an image, loaded in via the normal
  # way we load images.
  
  g.load.image \tiles assets+\tilemaps/tiles/super_mario.png

g-create = !->
  g.stage.background-color = \#787878

  # the 'mario' key here is the Loader key given in g.load.tilemap
  map = g.add.tilemap \mario

  # The first parameter is the tileset name, as specified in the Tiled map
  # editor (and in the tilemap JSON file)
  # The second parameter maps this name to the Phaser.Cache key 'tiles'
  map.add-tileset-image \SuperMarioBros-World1-1 \tiles

  # Creates a layer from the World1 layer in the map data.
  # A layer is effectively like a Phaser.Sprite, so it is added to the
  # display list.
  layer = map.create-layer \World1

  # This resizes the game world to match th layer dimensions
  layer.resize-world!

g-update = !->

g-render = !->

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
