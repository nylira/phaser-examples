// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var assets, gPreload, gCreate, gUpdate, gRender, g;
  assets = '../../../phaser/examples/assets/';
  gPreload = function(){
    g.load.image('image-key', assets + 'sprites/phaser2.png');
  };
  gCreate = function(){
    g.add.sprite(0, 0, 'image-key');
  };
  gUpdate = function(){};
  gRender = function(){};
  g = new Phaser.Game(800, 600, Phaser.CANVAS, '', {
    preload: gPreload,
    create: gCreate,
    update: gUpdate,
    render: gRender
  });
}).call(this);
