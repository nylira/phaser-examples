'use strict'
assets = \../../../phaser/examples/assets/

g-preload = !->
g-create = !->
g-update = !->
g-render = !->
  g.debug.render-text 'Host Name: ' + g.net.get-host-name!, g.world.center-x - 300, 20
  g.debug.render-text 'Host Name contains 192: ' + g.net.check-domain-name(\192), g.world.center-x - 300, 40
  g.debug.render-text 'Host Name contains google.com: ' + g.net.check-domain-name(\google.com), g.world.center-x - 300, 60

  # Add some values to the query string
  g.debug.render-text 'Query string with new values: ' + g.net.update-query-string(\atari \520), g.world.center-x - 400, 80
  g.debug.render-text 'Query string with new values: ' + g.net.update-query-string(\amiga \1200), g.world.center-x - 400, 100

  console.log 'Query string: ' + g.net.get-query-string!, g.world.center-x - 300, 140
  console.log 'Query string param: ' + g.net.get-query-string(\atari), g.world.center-x - 300, 160

g = new Phaser.Game(800, 600, Phaser.CANVAS, '',
  preload: g-preload, create: g-create, update: g-update, render: g-render)
