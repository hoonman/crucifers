#built using mc-build (https://github.com/mc-build/mc-build)

say radiate activated
execute as @s at @s run particle minecraft:block minecraft:slime_block ~ ~1 ~ 3 3 3 0.001 20 normal
execute as @s at @s run particle minecraft:spore_blossom_air ~ ~1 ~ 3 2 3 0.001 50 normal
playsound entity.slime.attack ambient @s ~ ~ ~