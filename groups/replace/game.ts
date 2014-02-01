'use strict'

var g, preload, create, render, select;
var left, right;
var selected = null;

preload = function(){
  g.load.spritesheet('item', 'assets/buttons/number-buttons-90x90.png', 90, 90);
}

create = function(){
  left = g.add.group();
  right = g.add.group();

  var item;

  for (var i=0; i<3; i++)
  {
    item = left.create(290, 98 * (i + 1), 'item', i);
    item.input.start(0, false, true);
    item.events.onInputUp.add(select);

    item = right.create(388, 98* (i + 1), 'item', i + 3)
    item.input.start(0, true);
    item.events.onInputUp.add(select);
  }
}

select = function(item, pointer){
  if (!selected) {
    selected = item;
    selected.alpha = 0.5;
  }
  else
  {
    if (selected.group !== item.group)
    {
      item.x = selected.x;
      item.y = selected.y;
      selected.group.replace(selected, item);
    }
    else
    {
      selected.alpha = 1;
    }
  }
  selected = null;
}

render = function(){
  g.debug.renderText('Left Group', 300, 80);
  g.debug.renderText('Right Group', 400, 80);
  g.debug.renderText('Click an item and one from another group to replace it.', 240, 480);
}

g = new Phaser.Game(
    800, 600, Phaser.CANVAS, '', { preload: preload, create: create}
    )
