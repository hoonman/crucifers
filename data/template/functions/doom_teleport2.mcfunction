#built using mc-build (https://github.com/mc-build/mc-build)

playsound block.end_portal.spawn ambient @a ~ ~ ~ 1 2
tp @a[tag=user] @e[tag=portal2,limit=1]
execute as @e[tag=portal2] at @s positioned ~0.1 ~2 ~ run tp @a[tag=user] ~ ~ ~ ~-90 ~
scoreboard players set @a[tag=user] carrot.timer 100
tag @a remove portalled
say p2
kill @e[tag=portal]