# center the object based on its width
center-x = (object) ->
  Math.floor(game.world.center-x - object.width/2)

# random in range
rnd-range = (min, max) ->
  random = Math.floor(Math.random! * (max - min))
  range = min + random
