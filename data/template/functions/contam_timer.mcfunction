#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @a[tag=user] contam_timer 1
execute as @a[tag=user,scores={contam_timer=1}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 2 0 2 0 100
execute as @a[tag=user,scores={contam_timer=2}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 4 0 4 0 150
execute as @a[tag=user,scores={contam_timer=3}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 6 0 6 0 200
execute as @a[tag=user,scores={contam_timer=4}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 8 0 8 0 250
execute as @a[tag=user,scores={contam_timer=5}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 10 0 10 0 300
execute as @a[tag=user,scores={contam_timer=6}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 12 0 12 0 400
execute as @a[tag=user,scores={contam_timer=7}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 14 0 14 0 800
execute as @a[tag=user,scores={contam_timer=8}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 16 0 16 0 1200
execute as @a[tag=user,scores={contam_timer=9}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 18 0 18 0 1500
execute as @a[tag=user,scores={contam_timer=10}] at @s run particle dust 0.102 1 0 1 ~ ~ ~ 20 0 20 0 2000
execute as @e[tag=!user,distance=..20,type=!armor_stand] at @s run say hi
execute as @e[tag=!user,distance=..20,type=!armor_stand] at @s run effect give @e[tag=!user,distance=..10] poison 3 100 false
execute as @e[tag=!user,distance=..20,type=!armor_stand] at @s run effect give @e[tag=!user,distance=..10] nausea 3 1 true
execute as @e[tag=!user,distance=..20,type=!armor_stand] at @s run effect give @e[tag=!user,distance=..10] wither 3 10 true
execute as @e[tag=user] at @e[tag=!user,type=!armor_stand,distance=..20] run particle dust 0.169 0.557 0.125 1 ~ ~1.8 ~ 0.3 0.3 0.3 0 100
playsound minecraft:entity.iron_golem.death voice @e[tag=user,type=player] ~ ~ ~ 50 0
execute as @e[tag=user,scores={contam_timer=..20}] run scoreboard players set @s radiate_timer 1
execute as @e[tag=user,scores={contam_timer=..10}] unless entity @a[scores={contam_timer=10}] run schedule function template:contam_timer 0.1s replace
execute as @e[tag=user,scores={contam_timer=10..}] run scoreboard players set @e[tag=user] contam_timer 0