// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var assets, sprite, counter, step, gPreload, gCreate, gUpdate, gRender, g;
  assets = '../../../phaser/examples/assets/';
  counter = 0;
  step = Math.PI * 2 / 360;
  gPreload = function(){
    g.load.image('sprite', assets + 'sprites/phaser2.png');
  };
  gCreate = function(){
    sprite = g.add.sprite(0, 0, 'sprite');
    sprite.alpha = 0.5;
    sprite.x = g.width / 2;
    sprite.anchor.setTo(0.5, 0.5);
  };
  gUpdate = function(){
    var tStep;
    tStep = Math.sin(counter);
    sprite.y = g.height / 2 + tStep * 30;
    sprite.rotation += Phaser.Math.degToRad(0.1 * tStep);
    counter += step;
  };
  gRender = function(){
    g.debug.renderCameraInfo(g.camera, 32, 32);
  };
  g = new Phaser.Game(800, 600, Phaser.CANVAS, '', {
    preload: gPreload,
    create: gCreate,
    update: gUpdate,
    render: gRender
  });
}).call(this);
