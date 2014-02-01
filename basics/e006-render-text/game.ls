'use strict'

game = new Phaser.Game(1200, 768, Phaser.AUTO, '', {
  create: create
})


function create()
  text1 = "The Elder Scrolls III"
  text2 = "Morrowind"

  h1 = {
    font: "128px Times"
    font-weight: "bold"
    fill: "hsl(35,50%,90%)"
    stroke: "hsl(25,60%,45%)"
    stroke-thickness: "5"
  }

  h2 = {
    font: "64px Times"
    fill: "hsl(35,50%,90%)"
    background: "red"
  }

  padding-top = 256

  text-group = game.add.group!

  tes3 = game.add.text(0, padding-top, text1, h2)
  tes3.x = center-x tes3
  text-group.add tes3

  morrowind = game.add.text(0, tes3.height + padding-top, text2, h1)
  morrowind.x = center-x morrowind

  text-group.add tes3
  text-group.add morrowind

# center the object based on its width
center-x = (object) ->
  Math.floor(game.world.center-x - object.width/2)
