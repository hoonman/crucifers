#built using mc-build (https://github.com/mc-build/mc-build)

execute as @s run tag @s add sneaking
say exsanguinate
playsound minecraft:entity.wither.death ambient @s ~ ~ ~ 50 0.9
playsound minecraft:block.lava.pop ambient @s ~ ~ ~ 50 0.3
execute as @s run tag @s remove sneaking
scoreboard players set @s sneak 0
scoreboard players reset @e