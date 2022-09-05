#built using mc-build (https://github.com/mc-build/mc-build)

say contaminate
kill @e[tag=contam]
execute as @s run tag @s add sneaking
execute as @s run tag @s remove sneaking
execute as @a[tag=user] run schedule function template:contam_timer 0.1s replace
scoreboard players set @s sneak 0
scoreboard players set @s xyneth.skulls 0
scoreboard players set @s xyneth.skulls_clicked 0