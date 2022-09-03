#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @e[tag=vis] timer 1
execute as @e[scores={timer=1},tag=vis,limit=1] at @s anchored eyes positioned ^ ^ ^1 run function template:shakal_fin_new
execute as @e[scores={timer=2},tag=vis,limit=1] at @s anchored eyes positioned ^ ^ ^2.5 run function template:shakal_fin_new
execute as @e[scores={timer=4},tag=vis,limit=1] at @s anchored eyes positioned ^ ^ ^4 run function template:shakal_fin_new
execute as @e[scores={timer=6},tag=vis,limit=1] at @s anchored eyes positioned ^ ^ ^5.5 run function template:shakal_fin_new
execute as @e[scores={timer=7},tag=vis] at @s run kill @s
execute as @a[scores={timer=100}] run tag @s remove shakal.toggler
execute as @e[tag=vis] if entity @s[scores={timer=150..}] run scoreboard players set @s timer 0
execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @s timer 0
execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @e[tag=vis] timer 0
execute if entity @s[scores={shakal.clicked=2..}] run scoreboard players set @s shakal.clicked 1