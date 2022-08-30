#built using mc-build (https://github.com/mc-build/mc-build)

say radiate activated
execute as @s at @s run particle minecraft:block minecraft:slime_block ~ ~1 ~ 3 3 3 0.001 20 normal
execute as @s at @s run particle minecraft:spore_blossom_air ~ ~1 ~ 3 2 3 0.001 50 normal
execute as @s run tag @s add user
execute as @e[tag=!user,distance=..7] run effect give @s wither 10 7 true
execute as @e[tag=!user,distance=..7] run effect give @s nausea 10 3 true
execute as @e[tag=!user,distance=..7] run effect give @s poison 10 7 false
tag @s remove user