// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var map, gamePreload, gameCreate, gameRender, addItem, fixLocation, game;
  map = require('prelude-ls').map;
  gamePreload = function(){
    return game.load.spritesheet('image-item', '../../../phaser/examples/assets/buttons/number-buttons-90x90.png', 90, 90);
  };
  gameCreate = function(){
    return map(addItem, [0, 1, 2, 3, 4, 5]);
  };
  gameRender = function(){
    game.debug.renderText('Group Left.', 100, 560);
    return game.debug.renderText('Group Right.', 280, 560);
  };
  addItem = function(i){
    var item;
    item = game.add.sprite(90, 90 * i, 'image-item', i);
    item.input.start(0, true);
    item.input.enableDrag();
    item.input.enableSnap(90, 90, false, true);
    return item.events.onDragStop.add(fixLocation);
  };
  fixLocation = function(item){
    if (item.x < 90) {
      return item.x - 90;
    } else if (item.x > 180 && item.x < 270) {
      return item.x = 180;
    } else if (item.x > 360) {
      return item.x = 270;
    }
  };
  game = new Phaser.Game(800, 600, Phaser.CANVAS, '', {
    preload: gamePreload,
    create: gameCreate,
    render: gameRender
  });
}).call(this);
