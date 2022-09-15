#built using mc-build (https://github.com/mc-build/mc-build)

say apply
execute store result score @s motion_x1 run data get entity @s Pos[0] 1000
execute store result score @s motion_y1 run data get entity @s Pos[1] 1000
execute store result score @s motion_z1 run data get entity @s Pos[2] 1000
tp @s ^ ^ ^0.1
execute store result score @s motion_x2 run data get entity @s Pos[0] 1000
execute store result score @s motion_y2 run data get entity @s Pos[1] 1000
execute store result score @s motion_z2 run data get entity @s Pos[2] 1000
execute store result entity @s Motion[0] double 0.005 run scoreboard players operation @s motion_x2 -= @s motion_x1
data modify entity @s Motion[1] set value 0.01
execute store result entity @s Motion[2] double 0.005 run scoreboard players operation @s motion_z2 -= @s motion_z1