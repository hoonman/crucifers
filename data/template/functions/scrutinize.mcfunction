#built using mc-build (https://github.com/mc-build/mc-build)

say scrutinize
execute as @s run tag @s add user
execute as @e[tag=!user,type=!item,type=!item_frame] run function template:scrutinize_effect
execute as @e[type=item] run data modify entity @s PickupDelay set value 0
execute as @s run team leave @s