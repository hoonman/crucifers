#built using mc-build (https://github.com/mc-build/mc-build)

say skulls
summon armor_stand ~ ~ ~ {NoAI:1b,Silent:1b,Tags:["skulls"],NoGravity:1b,Invisible:1b}
execute if entity @s[scores={xyneth.skulls_clicked=2..}] run kill @e[tag=skulls,tag=skulls2]
summon armor_stand ~ ~ ~ {NoAI:1b,Silent:1b,Tags:["skulls2"],NoGravity:1b,Invisible:1b}
spreadplayers ~ ~ 0.001 4 false @e[tag=skulls]
execute as @e[tag=skulls2] at @s run particle dust 0.102 0.867 0.165 1 ~ ~1.5 ~ 0.1 0.1 0.1 0.001 50 normal
scoreboard players set @s xyneth.skulls 0