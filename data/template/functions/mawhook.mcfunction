#built using mc-build (https://github.com/mc-build/mc-build)

say mawhook
kill @e[type=snowball]
execute as @s run tag @s add sneaking
scoreboard players set @s carrot.timer2 0
kill @e[tag=hook]
kill @e[tag=hook2]
execute as @s run schedule function template:mawhook_timer 0.1s replace
execute as @s run tag @s remove sneaking
scoreboard players set @s sneak 0
scoreboard players set @s snowball.use 0