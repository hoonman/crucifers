#built using mc-build (https://github.com/mc-build/mc-build)

execute as @a[tag=user] run effect give @s haste 1 2 true
execute as @a[tag=user] run effect give @s slow_falling 1 1 true
execute as @a[tag=user] positioned as @e[tag=!user,type=!armor_stand,type=!item,type=!item_frame,tag=!hover,limit=1,sort=nearest] run tp @s ~3 ~ ~ ~90 ~
execute as @e[tag=user,scores={feral.timer=..150}] unless entity @a[scores={feral.timer=150}] run schedule function template:feral_repeat 0.1s replace
scoreboard players add @a[tag=user] feral.timer 1