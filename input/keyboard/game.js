// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var sprUfo, btnLeft, btnRight, speed, gPreload, gCreate, gUpdate, gRender, g;
  speed = 4;
  gPreload = function(){
    g.world.setBounds(0, 0, 1280, 600);
    g.load.image('img-ground', '../../../phaser/examples/assets/tests/ground-2x.png');
    g.load.image('img-river', '../../../phaser/examples/assets/tests/river-2x.png');
    g.load.image('img-sky', '../../../phaser/examples/assets/tests/sky-2x.png');
    g.load.image('img-cloud0', '../../../phaser/examples/assets/tests/cloud-big-2x.png');
    g.load.image('img-cloud1', '../../../phaser/examples/assets/tests/cloud-narrow-2x.png');
    g.load.image('img-cloud2', '../../../phaser/examples/assets/tests/cloud-small-2x.png');
    g.load.spritesheet('spr-button', '../../../phaser/examples/assets/buttons/arrow-button.png', 112, 95);
    g.load.image('img-ufo', '../../../phaser/examples/assets/sprites/ufo.png');
  };
  gCreate = function(){
    g.add.tileSprite(0, 0, 1280, 600, 'img-sky');
    g.add.sprite(0, 360, 'img-ground');
    g.add.sprite(0, 400, 'img-river');
    g.add.sprite(200, 120, 'img-cloud0');
    g.add.sprite(-60, 120, 'img-cloud1');
    g.add.sprite(900, 160, 'img-cloud2');
    sprUfo = g.add.sprite(640, 240, 'img-ufo');
    sprUfo.anchor.setTo(0.5, 0.5);
    sprUfo.body.collideWorldBounds = true;
    g.camera.follow(sprUfo);
    btnLeft = g.add.sprite(g.world.centerX, 200, 'spr-button', 0);
    btnRight = g.add.sprite(g.world.centerX, 200, 'spr-button', 1);
  };
  gUpdate = function(){
    btnLeft.x = sprUfo.x - 300;
    btnRight.x = sprUfo.x + 200;
    if (g.input.keyboard.isDown(Phaser.Keyboard.LEFT)) {
      sprUfo.x -= speed;
      sprUfo.angle = -15;
      btnLeft.alpha = 0.6;
      btnRight.alpha = 0;
    } else if (g.input.keyboard.isDown(Phaser.Keyboard.RIGHT)) {
      sprUfo.x += speed;
      sprUfo.angle = 15;
      btnLeft.alpha = 0;
      btnRight.alpha = 0.6;
    } else {
      sprUfo.rotation = 0;
      btnLeft.alpha = btnRight.alpha = 0;
    }
  };
  gRender = function(){
    g.debug.renderText('Hold left/right to fly the UFO.');
  };
  g = new Phaser.Game(800, 600, Phaser.CANVAS, '', {
    preload: gPreload,
    create: gCreate,
    update: gUpdate,
    render: gRender
  });
}).call(this);
