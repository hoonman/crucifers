#built using mc-build (https://github.com/mc-build/mc-build)

say putrefaction
kill @e[tag=putre]
kill @e[tag=putre2]
kill @e[tag=putre3]
kill @e[tag=putre4]
kill @e[tag=putre5]
kill @e[tag=putre6]
scoreboard players set @a[tag=user] putre_timer 0
execute as @e[type=item] run data modify entity @s PickupDelay set value 0
execute as @a[tag=user] at @s run summon minecraft:armor_stand ~ ~12 ~ {Tags:["putre"],Invisible:1b}
execute as @e[tag=putre] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
execute as @e[tag=putre] run data modify entity @s Motion[0] set value 90.0f
execute as @a[tag=user] if entity @e[distance=..30,tag=!user] run schedule function template:putre_repeat 0.1s replace
execute as @s run tag @s remove xynethhold