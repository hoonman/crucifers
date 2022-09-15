#built using mc-build (https://github.com/mc-build/mc-build)

say mawhook two 22222
execute as @s[scores={carrot.timer2=100..}] run schedule function template:mawhooke2 1s replace
execute as @e[tag=hover2,sort=furthest,limit=1] at @s run kill @s
scoreboard players set @s snowball.use 0