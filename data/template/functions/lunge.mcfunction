#built using mc-build (https://github.com/mc-build/mc-build)

say lunge
kill @e[tag=temp]
scoreboard players set @s carrot.use 0
scoreboard players set @s carrot.timer 0
playsound entity.wither.shoot ambient @s ~ ~ ~ 1 2
playsound entity.ender_dragon.ambient ambient @s ~ ~ ~ 1 0
summon armor_stand ~ ~ ~ {Tags:["temp"],Invisible:1b}
execute as @s at @s rotated as @s run tp @e[tag=temp] @s
execute at @s rotated as @s as @e[tag=temp] run function template:apply_motion_rhakal
execute as @s run schedule function template:lunge_repeat 0.1s replace