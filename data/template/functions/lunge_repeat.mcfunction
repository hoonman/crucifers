#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @a[tag=user] carrot.timer 1
execute as @e[tag=temp] at @s rotated as @a[tag=user] run tp @a[tag=user] ~ ~ ~ ~ ~
execute at @a[tag=user] if block ~ ~-1 ~ air run tag @a[tag=user] add Air
execute as @a[tag=user,tag=!Air] run function template:lunge_effect
execute as @e[tag=user] unless entity @a[tag=!Air] run schedule function template:lunge_repeat 0.1s replace