// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var g, sprite1, sprite2, collisionHandler;
  g = new Phaser.Game(800, 600, Phaser.CANVAS, '', {
    preload: preload,
    create: create,
    update: update,
    render: render
  });
  function preload(){
    g.load.image('atari', '../../../phaser/examples/assets/sprites/atari130xe.png');
    return g.load.image('mushroom', '../../../phaser/examples/assets/sprites/mushroom2.png');
  }
  function create(){
    g.stage.backgroundColor = '#2d2d2d';
    sprite1 = g.add.sprite(50, 200, 'atari');
    sprite1.name = 'atari';
    sprite1.body.setRectangle(100, 50, 50, 25);
    sprite1.body.immovable = true;
    sprite2 = g.add.sprite(700, 220, 'mushroom');
    sprite2.name = 'mushroom';
    return sprite2.body.velocity.x = -100;
  }
  function update(){
    return g.physics.collide(sprite1, sprite2, collisionHandler, null, this);
  }
  collisionHandler = function(obj1, obj2){
    g.stage.backgroundColor = '#992d2d';
    return console.log(obj1 + ".name collided with " + obj2 + ".name");
  };
  function render(){
    g.debug.renderBodyInfo(sprite1, 32, 32);
    g.debug.renderPhysicsBody(sprite1.body);
    return g.debug.renderPhysicsBody(sprite2.body);
  }
}).call(this);
