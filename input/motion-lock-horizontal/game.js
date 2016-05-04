// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var sprite, gPreload, gCreate, gRender, g;
  gPreload = function(){
    g.load.image('img-parsec', '../../../phaser/examples/assets/sprites/parsec.png');
  };
  gCreate = function(){
    g.stage.backgroundColor = 'hsl(0,0%,33%)';
    sprite = g.add.sprite(200, 400, 'img-parsec');
    sprite.input.start(0, true);
    sprite.input.enableDrag();
    sprite.input.allowVerticalDrag = false;
  };
  gRender = function(){
    g.debug.renderInputInfo(32, 32);
    g.debug.renderSpriteInputInfo(sprite, 300, 32);
  };
  g = new Phaser.Game(800, 600, Phaser.CANVAS, '', {
    preload: gPreload,
    create: gCreate,
    render: gRender
  });
}).call(this);
