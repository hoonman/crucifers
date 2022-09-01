#built using mc-build (https://github.com/mc-build/mc-build)

execute as @s run tag @s add sneaking
say exsanguinate
playsound minecraft:entity.wither.death ambient @s ~ ~ ~ 1 0.9
playsound minecraft:block.lava.pop ambient @s ~ ~ ~ 50 0.3
execute as @s run schedule function template:exsan_sound 2.5s replace
execute as @a[tag=user] at @s anchored eyes positioned ~ ~1 ~ run function template:exsan_symbol
execute as @e[tag=!user] facing entity @e[tag=user] eyes run data modify entity @s Motion[0] set value 0.7d
execute as @e[tag=!user] facing entity @e[tag=user] eyes run data modify entity @s Motion[1] set value 0.5d
execute as @e[tag=!user] facing entity @e[tag=user] eyes run data modify entity @s Motion[2] set value 0.0d
execute as @s run tag @s remove sneaking
scoreboard players set @s sneak 0
scoreboard players reset @e