#built using mc-build (https://github.com/mc-build/mc-build)

say feral repeat
execute as @a[tag=user] run effect give @s haste 1 2 true
execute as @e[tag=!user,type=!armor_stand,tag=!hover,limit=1] at @s run tp @a[tag=user] ^ ^0.1 ^5 ~180 ~
execute as @e[tag=!user,type=!armor_stand,tag=!hover,limit=1] at @s run data modify entity @s Rotation[1] set value -40f
execute as @e[tag=user,scores={feral.timer=..30}] unless entity @a[scores={feral.timer=30}] run schedule function template:feral_repeat 0.1s replace
scoreboard players add @a[tag=user] feral.timer 1