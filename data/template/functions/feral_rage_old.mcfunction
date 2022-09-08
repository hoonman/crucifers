#built using mc-build (https://github.com/mc-build/mc-build)

say feral rage
scoreboard players set @a[tag=user] feral.timer 0
execute as @a[tag=user] run tag @s remove voluntary
execute as @e[type=item] run data modify entity @s PickupDelay set value 0
execute as @a[tag=user] at @s rotated as @e[tag=!hover,tag=!user,distance=..5,limit=1] run function template:feral_apply_motion
execute as @a[tag=user] if entity @e[tag=!user] run schedule function template:feral_repeat 0.1s replace
execute as @s run tag @s remove werejixhold