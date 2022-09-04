#built using mc-build (https://github.com/mc-build/mc-build)

say visceral 5
tag @s add user
tag @a[tag=user] add shakal.toggler
kill @e[tag=vis]
summon armor_stand ~ ~ ~ {NoAI:1b,Silent:1b,NoGravity:1b,Invisible:1b,Invulnerable:1b}
tag @e[type=armor_stand,distance=..1] add vis
execute as @s store result score @s visceral.rot1 run data get entity @s Rotation[0] 1
execute as @s store result score @s visceral.rot2 run data get entity @s Rotation[1] 1
execute store result storage minecraft:rot1 rot1 float 1 run scoreboard players get @a[tag=user,limit=1] visceral.rot1
execute store result storage minecraft:rot2 rot2 float 1 run scoreboard players get @a[tag=user,limit=1] visceral.rot2
execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s instant_damage 1 1 true
execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s wither 1 1 true
execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s instant_health 1 1 true
execute as @e[tag=!user,tag=!vis] at @a[tag=user] if entity @s[distance=..7] facing entity @a[tag=user] eyes at @s run tp @s ^ ^1.6 ^-2
data modify entity @e[limit=1,tag=vis] Rotation[0] set from storage minecraft:rot1 rot1
data modify entity @e[limit=1,tag=vis] Rotation[1] set from storage minecraft:rot2 rot2
playsound entity.wither.shoot ambient @s ~ ~ ~ 50 0
scoreboard players set @s shakal.visceral 0