// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var game, background, button, onClick;
  game = new Phaser.Game(800, 600, Phaser.CANVAS, '', {
    preload: preload,
    create: create,
    update: update
  });
  function preload(){
    game.load.spritesheet('button', '../../../phaser/examples/assets/buttons/button_sprite_sheet.png', 193, 71);
    return game.load.image('background', '../../../phaser/examples/assets/misc/starfield.jpg');
  }
  function create(){
    game.stage.backgroundColor = '#182d3b';
    background = game.add.tileSprite(0, 0, 800, 600, 'background');
    button = game.add.button(400, 300, 'button', onClick, this, 2, 1, 0);
    button.anchor.setTo(0.5, 0.5);
    button.anchor.setTo(0.5, 0.5);
    return button.x = game.world.centerX;
  }
  function update(){
    return button.rotation += 0.01;
  }
  onClick = function(){
    return background.visible = !background.visible;
  };
}).call(this);
