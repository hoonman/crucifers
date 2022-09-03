#built using mc-build (https://github.com/mc-build/mc-build)

say scrutinize
execute as @s run tag @s add user
execute as @e[tag=!user,type=!item,type=!item_frame,tag=!vis] run function template:scrutinize_effect
execute as @a[tag=user] at @s anchored eyes positioned ~ ~1 ~ run function template:scru_symbol
execute as @e[type=item] run data modify entity @s PickupDelay set value 0
execute as @s run team leave @s
execute as @s run tag @s remove shakalhold