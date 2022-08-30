#built using mc-build (https://github.com/mc-build/mc-build)

say visceralv4
kill @e[tag=fin]
kill @e[tag=fin2]
tag @s add user
execute as @s at @s run summon armor_stand ^ ^ ^1.8 {Tags:["fin"],NoGravity:1,Invisible:1b}
execute as @e[tag=fin] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~ ~
execute as @e[tag=fin] at @s facing ^1.8 ^ ^ positioned ^-0.7 ^ ^ run function template:shakal_fin
execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s instant_damage 1 1 true
execute as @e[tag=!user] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[distance=..7] run effect give @s instant_health 1 1 true
playsound entity.wither.shoot ambient @s ~ ~ ~ 50 0
scoreboard players set @s shakal.visceral 0