#built using mc-build (https://github.com/mc-build/mc-build)

playsound minecraft:entity.wither.spawn ambient @a ~ ~ ~ 10 0
execute as @s run team join scrutinized @s
execute as @s run data modify entity @s Rotation[1] set value 180f
execute as @s run data modify entity @s NoGravity set value 1b
execute as @s run data remove entity @s HandItems[0]
execute as @s run tag @s add hurt
execute as @s run scoreboard players set @s shakal.hemorrhage 0
execute as @s run function template:hem_bleeding
execute run schedule function template:removegravity 8.0s append
execute as @e[tag=hurt] if entity @e[scores={shakal.hemorrhage=8..}] run tag @s remove hurt
execute as @s run effect give @s blindness 8 8
execute as @s run effect give @s glowing 8 8
execute as @s run effect give @s hunger 8 8
execute as @s run effect give @s levitation 1 0
execute as @s run effect give @s mining_fatigue 8 8
execute as @s run effect give @s night_vision 8 8
execute as @s run effect give @s nausea 8 8
execute as @s run effect give @s slow_falling 8 8
execute as @s run effect give @s slowness 8 8
execute as @s run effect give @s unluck 8 8
execute as @s run effect give @s weakness 8 8