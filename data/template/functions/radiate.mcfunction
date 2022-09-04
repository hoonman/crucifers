#built using mc-build (https://github.com/mc-build/mc-build)

execute as @s run tag @s add radiate_user
scoreboard players add @s radiate_timer 1
execute as @e[tag=radiate_user] if entity @s[scores={radiate_timer=20..}] run scoreboard players set @s radiate_timer 0
execute as @e[tag=radiate_user] if entity @s[scores={radiate_timer=10}] at @s run particle block minecraft:slime_block ~ ~1 ~ 3 3 3 0.001 200 normal
execute as @e[tag=radiate_user] if entity @s[scores={radiate_timer=10}] at @s run playsound minecraft:entity.slime.attack ambient @a[tag=user] ~ ~ ~ 200 0
execute as @e[tag=!radiate_user,distance=..7] if entity @a[scores={radiate_timer=10}] run effect give @s wither 1 3 false
execute as @e[tag=!radiate_user,distance=..7] run effect give @s nausea 1 3 true
execute as @e[tag=!radiate_user,distance=..7,type=!armor_stand,type=!arrow] at @s anchored eyes run particle dust 0.212 0.808 0.38 1 ~ ~2 ~ 0.01 0.01 0.01 0.001 10 normal
tag @s remove radiate_user