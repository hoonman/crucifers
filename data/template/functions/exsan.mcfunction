#built using mc-build (https://github.com/mc-build/mc-build)

execute as @s run tag @s add sneaking
kill @e[tag=exsan]
say exsanguinate
playsound minecraft:entity.wither.death ambient @s ~ ~ ~ 1 0.9
execute as @e[tag=!user] at @s run effect give @s slowness 10 255 true
playsound minecraft:block.lava.pop ambient @s ~ ~ ~ 50 0.3
execute as @e[tag=!user,type=!arrow,type=!item,type=!item_frame,type=!armor_stand] at @s run summon armor_stand ~ ~0.1 ~ {Tags:["exsan"],ActiveEffects:[{Id:28,Duration:1000000,ShowParticles:true}],Invisible:1b,NoGravity:1b}
execute as @s run schedule function template:exsan_sound 2.5s replace
execute as @a[tag=user] at @s anchored eyes positioned ~ ~1 ~ run function template:exsan_symbol
execute as @s run tag @s remove sneaking
scoreboard players set @s sneak 0
scoreboard players reset @e