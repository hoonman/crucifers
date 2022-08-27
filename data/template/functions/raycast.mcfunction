#built using mc-build (https://github.com/mc-build/mc-build)

say tipped fire
particle flame ~ ~ ~ 0 0 0 0 1
execute as @e[type=!player,distance=..2] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..2] run effect give @s instant_damage 1 1 true
execute as @e[type=!player,distance=..2] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..2] run effect give @s instant_health 1 1 true
execute positioned ^ ^ ^1 if block ~ ~ ~ air run function template:raycast
playsound entity.arrow.shoot ambient @s ~ ~ ~ 0.5 2
scoreboard players reset @e