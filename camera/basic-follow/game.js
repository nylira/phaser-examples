// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var game, player, fixed, cursors, enemies, bg1, bg2;
  game = new Phaser.Game(800, 600, Phaser.AUTO, '', {
    preload: preload,
    create: create,
    update: update
  });
  function preload(){
    game.load.image('background', '../../../phaser/examples/assets/misc/starfield.jpg');
    game.load.image('ufo', '../../../phaser/examples/assets/sprites/space-baddie.png');
    return game.load.image('player', '../../../phaser/examples/assets/sprites/phaser-dude.png');
  }
  function create(){
    var i$, i, enemy;
    bg1 = game.add.tileSprite(0, 0, 2048, 2048, 'background');
    game.world.setBounds(0, 0, 1400, 1400);
    enemies = game.add.group();
    for (i$ = 0; i$ < 100; ++i$) {
      i = i$;
      enemy = game.add.sprite(game.world.randomX, game.world.randomY, 'ufo');
      enemy.anchor.setTo(0.5, 0.5);
      enemies.add(enemy);
    }
    fixed = game.add.sprite(300, 320, 'player');
    fixed.fixedToCamera = true;
    fixed.cameraOffset.y = 300;
    player = game.add.sprite(150, 320, 'player');
    cursors = game.input.keyboard.createCursorKeys();
    return game.camera.follow(player);
  }
  function update(){
    player.body.velocity.setTo(0, 0);
    if (cursors.up.isDown) {
      player.body.velocity.y = -200;
    } else if (cursors.down.isDown) {
      player.body.velocity.y = 200;
    }
    if (cursors.left.isDown) {
      return player.body.velocity.x = -200;
    } else if (cursors.right.isDown) {
      return player.body.velocity.x = 200;
    }
  }
}).call(this);
