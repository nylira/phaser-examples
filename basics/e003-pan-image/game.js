// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var game;
  game = new Phaser.Game(1200, 768, Phaser.AUTO, '', {
    preload: preload,
    create: create
  });
  function preload(){
    return game.load.image('sky', '../../../phaser/examples/assets/misc/starfield.png');
  }
  function create(){
    var image;
    image = game.add.sprite(0, 0, 'sky');
    return image.body.velocity.x = 50;
  }
}).call(this);
