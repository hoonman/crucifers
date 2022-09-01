#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @a timer 1
execute if entity @s[scores={timer=2}] as @e[tag=fin] at @s run summon armor_stand ^ ^ ^1.8 {Tags:["fin2"],NoGravity:1}
execute as @e[tag=fin2] at @s rotated as @e[tag=fin] run tp @s ~ ~ ~ ~ ~
execute as @e[tag=fin] at @e[tag=fin2] facing ^1.8 ^ ^ positioned ^-0.7 ^ ^ run function template:shakal_fin
execute if entity @e[tag=fin2,distance=..10] run kill @e[tag=fin2]
execute if entity @s[scores={timer=4}] as @e[tag=fin] at @s run summon armor_stand ^ ^ ^3.6 {Tags:["fin3"],NoGravity:1}
execute as @e[tag=fin3] at @s rotated as @e[tag=fin] run tp @s ~ ~ ~ ~ ~
execute as @e[tag=fin] at @e[tag=fin3] facing ^1.8 ^ ^ positioned ^-0.7 ^ ^ run function template:shakal_fin
execute if entity @e[tag=fin3,distance=..10] run kill @e[tag=fin3]
execute if entity @s[scores={timer=6}] as @e[tag=fin] at @s run summon armor_stand ^ ^ ^5.4 {Tags:["fin3"],NoGravity:1}
execute as @e[tag=fin3] at @s rotated as @e[tag=fin] run tp @s ~ ~ ~ ~ ~
execute as @e[tag=fin] at @e[tag=fin3] facing ^1.8 ^ ^ positioned ^-0.7 ^ ^ run function template:shakal_fin
execute if entity @e[tag=fin3,distance=..10] run kill @e[tag=fin3]
execute if entity @s[scores={timer=7}] run kill @e[tag=fin]
execute if entity @s[scores={timer=200..}] as @e[tag=user] run scoreboard players set @s timer 0
execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @s timer 0
execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @s shakal.clicked 1