// Generated by LiveScript 1.2.0
(function(){
  'use strict';
  var left, right, selected, preload, create, select, render, g;
  selected = null;
  preload = function(){
    return g.load.spritesheet('item', '../../../phaser/examples/assets/buttons/number-buttons-90x90.png', 90, 90);
  };
  create = function(){
    var item, i$, i;
    left = g.add.group();
    right = g.add.group();
    for (i$ = 0; i$ < 3; ++i$) {
      i = i$;
      item = left.create(290, 98 * (i + 1), 'item', i);
      item.input.start(0, false, true);
      item.events.onInputUp.add(select);
      item = right.create(388, 98 * (i + 1), 'item', i + 3);
      item.input.start(0, true);
      item.events.onInputUp.add(select);
    }
  };
  select = function(item, pointer){
    if (!selected) {
      selected = item;
      selected.alpha = 0.5;
    } else {
      if (selected.group !== item.group) {
        item.x = selected.x;
        item.y = selected.y;
        selected.group.replace(selected, item);
      } else {
        selected.alpha = 1;
      }
      selected = null;
    }
  };
  render = function(){
    g.debug.renderText("Left Group", 280, 80);
    g.debug.renderText("Right Group", 390, 80);
    return g.debug.renderText("Click an item and one from another group to replace it.", 240, 480);
  };
  g = new Phaser.Game(800, 600, Phaser.CANVAS, '', {
    preload: preload,
    create: create,
    render: render
  });
}).call(this);
