#built using mc-build (https://github.com/mc-build/mc-build)

say putre repeat
scoreboard players add @e[tag=user] putre_timer 1
execute as @e[tag=user,scores={putre_timer=..11}] at @s run playsound minecraft:entity.zombie.attack_wooden_door ambient @a[tag=user] ~ ~ ~ 100 0
execute as @e[tag=user,scores={putre_timer=11}] run playsound minecraft:entity.zombie.break_wooden_door ambient @a ~ ~ ~ 100 0
execute as @e[tag=user,scores={putre_timer=11}] at @s run particle block lime_terracotta ~ ~ ~ 10 1 10 0 2000
execute as @e[tag=user,scores={putre_timer=11}] at @s run particle dust 0.259 0.427 0.208 1 ~ ~ ~ 10 0 10 0 1000
execute if entity @a[tag=user,scores={putre_timer=11}] as @e[distance=..30,type=!armor_stand,tag=!user,team=!scrutinized,tag=!hurt] at @s rotated as @p run function template:apply_motion
execute as @a[tag=user] if entity @a[tag=user,scores={putre_timer=11}] at @a[tag=user] run summon armor_stand ~ ~ ~ {Tags:["putre2"],Invisible:1b}
execute as @a[tag=user] if entity @a[tag=user,scores={putre_timer=11}] at @a[tag=user] run summon armor_stand ~ ~ ~ {Tags:["putre3"],Invisible:1b}
execute as @a[tag=user] if entity @a[tag=user,scores={putre_timer=11}] at @a[tag=user] run summon armor_stand ~ ~ ~ {Tags:["putre4"],Invisible:1b}
execute as @a[tag=user] if entity @a[tag=user,scores={putre_timer=11}] at @a[tag=user] run summon armor_stand ~ ~ ~ {Tags:["putre5"],Invisible:1b}
execute as @a[tag=user] if entity @a[tag=user,scores={putre_timer=11}] at @a[tag=user] run summon armor_stand ~ ~ ~ {Tags:["putre6"],Invisible:1b}
execute as @e[tag=putre2] at @s facing entity @e[distance=..30,tag=!user,type=!armor_stand,type=!arrow,limit=1,sort=nearest] feet if entity @a[tag=user,scores={putre_timer=11..}] run tp @s ^1.5 ^ ^0.5
execute as @e[tag=putre3] at @s facing entity @e[distance=..30,tag=!user,type=!armor_stand,type=!arrow,limit=1,sort=furthest] feet if entity @a[tag=user,scores={putre_timer=11..}] run tp @s ^-1.5 ^ ^0.5
execute as @e[tag=putre4] at @s facing entity @e[distance=..30,tag=!user,type=!armor_stand,type=!arrow,limit=1,sort=random] feet if entity @a[tag=user,scores={putre_timer=11..}] run tp @s ^ ^ ^-0.5
execute as @e[tag=putre5] at @s facing entity @e[distance=..30,tag=!user,type=!armor_stand,type=!arrow,limit=1,sort=nearest] feet if entity @a[tag=user,scores={putre_timer=11..}] run tp @s ^-1.5 ^ ^-0.5
execute as @e[tag=putre6] at @s facing entity @e[distance=..30,tag=!user,type=!armor_stand,type=!arrow,limit=1,sort=furthest] feet if entity @a[tag=user,scores={putre_timer=11..}] run tp @s ^1.5 ^ ^-0.5
execute if entity @a[tag=user,scores={putre_timer=11}] as @e[type=!armor_stand,tag=!user,distance=..30] at @s run particle block slime_block ~ ~ ~ 0 3 0 0 300
execute if entity @a[tag=user,scores={putre_timer=11}] as @e[type=!armor_stand,tag=!user,distance=..30] at @s store result entity @s Health float 1 run scoreboard players remove @s health 10
execute if entity @a[tag=user,scores={putre_timer=11}] as @e[type=!armor_stand,tag=!user,distance=..30] at @s run effect give @s wither 1 1 true
execute as @e[tag=putre2] at @s run particle dust 0.251 1 0 1 ~ ~ ~ 0 0 0 0 30
execute as @e[tag=putre3] at @s run particle dust 0.251 1 0 1 ~ ~ ~ 0 0 0 0 30
execute as @e[tag=putre4] at @s run particle dust 0.251 1 0 1 ~ ~ ~ 0 0 0 0 30
execute as @e[tag=putre5] at @s run particle dust 0.251 1 0 1 ~ ~ ~ 0 0 0 0 30
execute as @e[tag=putre6] at @s run particle dust 0.251 1 0 1 ~ ~ ~ 0 0 0 0 30
execute as @e[tag=user,scores={putre_timer=..30}] run scoreboard players set @s radiate_timer 1
execute as @e[tag=putre] at @s facing ^0.1 ^ ^ positioned as @e[tag=putre] positioned ^ ^-2 ^3 run function template:xyneth_faceup_relativelocal
execute as @e[tag=user,scores={putre_timer=30..}] run kill @e[tag=putre]
execute as @e[tag=user,scores={putre_timer=..30}] unless entity @a[scores={putre_timer=30}] run schedule function template:putre_repeat 0.1s replace
execute as @e[tag=user,scores={putre_timer=30..}] run kill @e[type=armor_stand]
execute as @e[tag=user,scores={putre_timer=30..}] run scoreboard players set @e[tag=user] putre_timer 0