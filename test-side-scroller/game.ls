'use strict'

game = new Phaser.Game(1200, 480, Phaser.AUTO, '',
  preload: preload
  create: create
  update: update
)

function preload
  game.load.image \background \../../../phaser/examples/assets/starfield.jpg
  game.load.image \ufo \../../../phaser/examples/assets/space-baddie.png
  game.load.image \star \../../../phaser/examples/assets/star.png
  game.load.image \player \../../../phaser/examples/assets/phaser-dude.png
  game.load.image \ground \../../../phaser/examples/assets/steel-32.png

var player
var cursors
var bg1
var bg2
var score-text

# groups
var enemies
var backgrounds
var platforms

# variables
score = 0
world-velocity = -200
death = false

function create
  backgrounds := game.add.group!
  generate-backgrounds!

  platforms := game.add.group!
  for i til 40
    ground = platforms.create i*32, 448, \ground, 4
    ground.body.immovable = true
    platforms.add ground

  enemies := game.add.group!
  set-interval generate-enemies, 1500

  generate-player!
  cursors := game.input.keyboard.create-cursor-keys!

  score-text := game.add.text(
    16 16 'Avoided: 0' { font-size: '32px', fill: '#fff'})

function update
  if death == false

    # collision
    game.physics.collide player, platforms, '', null, @
    game.physics.overlap player, enemies, kill-enemies, null, this

    player.body.velocity.set-to 0 0

    if cursors.up.is-down
      player.body.velocity.y = -400

    score-text.content = "Avoided: #score"

    # enemy movement/scoring
    enemies.for-each (enemy) -> 
      if enemy.x < -20
        if enemy.alive == true
          score += 1
          enemy.kill!
          world-velocity := world-velocity - 0.5
      else
        enemy.rotation += 0.02 * enemy.body.velocity.x/25

    # shuffle backgrounds
    if bg1.x <= -1536
      bg1.x = bg2.x + 1536
    if bg2.x <= -1536
      bg2.x = bg1.x + 1536

    # background speed
    backgrounds.for-each (bg) ->
      bg.body.velocity.x = world-velocity

  else
    score-text.content = "You died. Reload to try again."

rnd-range = (min, max) ->
  rnd-value = Math.floor(Math.random! * (max - min))
  range = min + rnd-value

generate-backgrounds = ->
  bg1 := game.add.tile-sprite 0 0 1536 512 \background
  bg2 := game.add.tile-sprite 1536 0 1536 512 \background
  backgrounds.add bg1
  backgrounds.add bg2

generate-player = ->
  player := game.add.sprite 150, game.world.center-y, \player
  player.body.gravity.y = 300
  player.body.collide-world-bounds = true

generate-enemies = ->
  random-amount = Math.floor rnd-range 2 4
  for i til random-amount
    x = game.world.width + game.world.random-x / 2
    y = game.world.random-y
    scale = rnd-range(1, 3)

    enemy = game.add.sprite x, y, \star
    enemy.scale.set-to scale, scale
    enemy.body.velocity.x = world-velocity
    enemy.anchor.set-to 0.5 0.5
    enemies.add enemy

kill-enemies = (player, enemy) ->
  death := true

  # 'kill' player model
  player.rotation = Math.PI * 0.5
  player.scale.x = 0.5

  # stop world
  world-velocity := 0

  # stop enemies
  enemies.for-each (enemy) -> 
    enemy.rotation = 0
    enemy.body.velocity.x = 0
