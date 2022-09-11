#built using mc-build (https://github.com/mc-build/mc-build)

say doom portal
tag @a[tag=user] add portalled
scoreboard players set @s carrot.timer 0
execute as @s run tag @s add sneaking
playsound block.end_portal.spawn ambient @a ~ ~ ~ 1 0
execute as @a[tag=user] rotated as @s at @s if entity @e[tag=portal] run summon armor_stand ^ ^ ^3 {Tags:["portal2"],NoGravity:1b,Invisible:1b}
execute as @a[tag=user] rotated as @s at @s unless entity @e[tag=portal] run summon armor_stand ^ ^ ^3 {Tags:["portal"],NoGravity:1b,Invisible:1b}
execute as @e[tag=portal] unless entity @e[tag=portal2] at @s rotated as @a[tag=user] facing entity @a[tag=user] eyes run particle dust 0 0 0 1 ~ ~ ~ 3 5 3 0 800
execute as @e[tag=portal2] at @s rotated as @a[tag=user] facing entity @a[tag=user] eyes run particle dust 0 0 0 1 ~ ~ ~ 3 5 3 0 800
execute as @a[tag=user] run schedule function template:doom_repeat 0.1s replace
execute as @e[tag=portal] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
execute as @e[tag=portal] run data modify entity @s Motion[0] set value 90.0f
execute as @e[tag=portal2] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
execute as @e[tag=portal2] run data modify entity @s Motion[0] set value 90.0f
scoreboard players set @s carrot.use2 0
scoreboard players set @s sneak 0
execute as @s run tag @s remove sneaking