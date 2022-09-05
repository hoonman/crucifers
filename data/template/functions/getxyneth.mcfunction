#built using mc-build (https://github.com/mc-build/mc-build)

playsound entity.wither.spawn hostile @s ~ ~ ~ 50 0
playsound entity.wither.spawn voice @a ~ ~ ~ 50 0
execute as @s at @s run playsound entity.wither.spawn ambient @s ~ ~ ~ 50 0
particle dust 0 0 0 1 ~ ~ ~ 7 7 7 0.0001 400 normal
kill @e[type=item,distance=..3]
summon item ~ ~ ~