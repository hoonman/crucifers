#built using mc-build (https://github.com/mc-build/mc-build)

say feral rage!
effect give @s blindness 1 1 true
playsound entity.ender_dragon.growl ambient @a ~ ~ ~ 200 0
scoreboard players set @a[tag=user] feral.timer 0
execute as @e[type=item] run data modify entity @s PickupDelay set value 0
execute as @s at @s positioned ~ ~1.4 ~ run function template:werejix_face
execute as @a[tag=user] if entity @e[tag=!user] run schedule function template:feral_repeat 0.1s replace
execute as @s run tag @s remove werejixhold