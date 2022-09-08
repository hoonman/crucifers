#built using mc-build (https://github.com/mc-build/mc-build)

say feral rage!
playsound entity.ender_dragon.growl ambient @a ~ ~ ~ 100 0
scoreboard players set @a[tag=user] feral.timer 0
execute as @e[type=item] run data modify entity @s PickupDelay set value 0
execute as @a[tag=user] if entity @e[tag=!user] run schedule function template:feral_repeat 0.1s replace
execute as @s run tag @s remove werejixhold