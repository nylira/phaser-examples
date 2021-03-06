// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var map, cursors, gamePreload, gameCreate, gameUpdate, gameRender, game;
  map = require('prelude-ls').map;
  gamePreload = function(){
    game.stage.scale.maxWidth = 800;
    game.stage.scale.maxHeight = 600;
    game.stage.scaleMode = Phaser.StageScaleMode.SHOW_ALL;
    game.stage.scale.setShowAll();
    game.stage.scale.refresh();
    return game.load.image('image-melon', '../../../phaser/examples/assets/sprites/melon.png');
  };
  gameCreate = function(){
    var i$, i;
    game.world.setBounds(0, 0, 2000, 2000);
    for (i$ = 0; i$ < 1000; ++i$) {
      i = i$;
      game.add.sprite(game.world.randomX, game.world.randomY, 'image-melon');
    }
    return cursors = game.input.keyboard.createCursorKeys();
  };
  gameUpdate = function(){
    if (cursors.left.isDown) {
      game.camera.x -= 4;
    } else if (cursors.right.isDown) {
      game.camera.x += 4;
    }
    if (cursors.up.isDown) {
      return game.camera.y -= 4;
    } else if (cursors.down.isDown) {
      return game.camera.y += 4;
    }
  };
  gameRender = function(){
    return game.debug.renderInputInfo(16, 16);
  };
  game = new Phaser.Game(320, 240, Phaser.CANVAS, '', {
    preload: gamePreload,
    create: gameCreate,
    update: gameUpdate,
    render: gameRender
  });
}).call(this);
