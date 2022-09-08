#built using mc-build (https://github.com/mc-build/mc-build)

execute as @s run effect give @s minecraft:wither 1 1 true
execute as @s run effect give @s minecraft:instant_damage 1 1 true
execute as @s run effect give @s minecraft:instant_health 1 1 true
execute as @s at @s rotated as @p run function template:apply_motion