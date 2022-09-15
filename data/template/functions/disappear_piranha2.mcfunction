#built using mc-build (https://github.com/mc-build/mc-build)

say disappear piranha 2
execute as @e[tag=hover4] run tp @s ~ ~-200 ~
execute as @e[tag=hover4] run kill @s
execute as @a[tag=user] run scoreboard players set @s carrot.timer 0