#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @e[tag=hurt] shakal.hemorrhage 1
execute if entity @e[tag=hurt,scores={shakal.hemorrhage=..8}] run schedule function template:hem_bleeding 0.7s replace
execute if entity @e[tag=hurt,scores={shakal.hemorrhage=8..}] run tag @e[tag=hurt] remove hurt
execute if entity @e[scores={shakal.hemorrhage=8..}] run scoreboard players reset @e
execute as @e[tag=hurt] at @s run effect give @s instant_damage 1 1 true
execute as @e[tag=hurt] at @s run effect give @s instant_health 1 1 true
execute as @e[tag=hurt] at @s run particle minecraft:block minecraft:redstone_wire ~ ~1.24 ~ 0.1 0.1 0.1 0.001 50 normal
execute if entity @e[tag=hurt] as @p at @s run function template:__generated__/block/1