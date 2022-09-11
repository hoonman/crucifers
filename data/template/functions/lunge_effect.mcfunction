#built using mc-build (https://github.com/mc-build/mc-build)

say on ground!
execute at @a[tag=user] run playsound entity.iron_golem.death ambient @a[tag=user] ~ ~ ~ 1 2
execute as @a[tag=user] at @s run particle block lapis_block ~ ~1 ~ 10 1 10 0 300
execute as @a[tag=user] at @s run particle enchanted_hit ~ ~1 ~ 10 1 10 0 400
execute as @a[tag=user] at @s if entity @e[tag=!user,distance=..10] run effect give @e[tag=!user,distance=..10] wither 1 1 true