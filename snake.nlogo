globals [
  blt
  score
  lives
  ]

patches-own [ttl]

to setup
  ca
  cro 1 [set ttl 3]
  set blt 3
  set score 0
  set lives 3
  draw-walls
  init-snake
  plant-food
end

to draw-walls
  ask patches [
    if abs pxcor = max-pxcor or abs pycor = max-pycor [
      set pcolor blue]
  ]
end

to init-snake
  ask patch 0 -1
  [set pcolor red set ttl 2]
  ask patch 0 -2
  [set pcolor red set ttl 1]
end

to plant-food
  ask one-of patches with [pcolor = black]
  [set pcolor green]
end

to go 
  ifelse lives > 0 [
  set pcolor red
  fd 1 
  set ttl blt + 1
  if difficulty = 1 [wait .16]
  if difficulty = 2 [wait .14]
  if difficulty = 3 [wait .12]
  if pcolor = blue or pcolor = red
   [stop 
     print "Game Over"]
   if pcolor = green [
      plant-food
      set score score + 1
     set pcolor black
     set blt blt + 1
     ]
   ask patches with [ttl > 0] [set ttl ttl - 1
   if ttl = 0 [set pcolor black]
   ]]
   [game-over die]
end


to game-over
  set color black setxy -1 -1 
end

to up
  set heading 0
end

to down 
  set heading 180
end

to lefty 
  set heading 270
end

to righty 
  set heading 90
end
