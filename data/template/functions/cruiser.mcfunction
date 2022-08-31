#built using mc-build (https://github.com/mc-build/mc-build)

execute as @s run tag @s add sneaking
say infernal cruiser
particle flame ~ ~ ~ 0 0 0 0.1 30
particle large_smoke ~ ~ ~ 0 0 0 0.01 5
particle lava ~ ~ ~ 0 0 0 0.01 5
execute as @e[type=!player,distance=..5] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..5] at @s run playsound entity.generic.explode ambient @a ~ ~ ~
execute as @e[type=!player,distance=..7] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run kill @s
execute positioned ^ ^ ^1 if block ~ ~ ~ air run function template:cruiser
playsound entity.dragon_fireball.explode ambient @s ~ ~ ~ 0.5 1
execute as @s run tag @s remove sneaking
scoreboard players set @s sneak 0
scoreboard players reset @e