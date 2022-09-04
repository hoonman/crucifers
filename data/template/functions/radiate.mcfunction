#built using mc-build (https://github.com/mc-build/mc-build)

execute as @s run tag @s add radiate_user
scoreboard players add @s radiate_timer 1
execute as @e[tag=radiate_user] if entity @s[scores={radiate_timer=100..}] run scoreboard players set @s radiate_timer 0
execute as @s at @s run particle minecraft:block minecraft:slime_block ~ ~1 ~ 4 4 4 0.001 15 normal
execute as @e[tag=!radiate_user,distance=..7] run effect give @s wither 1 7 true
execute as @e[tag=!radiate_user,distance=..7] run effect give @s nausea 1 3 true
execute as @e[tag=!radiate_user,distance=..7] run effect give @s poison 1 7 false
tag @s remove radiate_user
execute as @e[scores={xyneth.radiate=2..}] run scoreboard players set @s xyneth.radiate 0