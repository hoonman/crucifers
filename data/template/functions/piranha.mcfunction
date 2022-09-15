#built using mc-build (https://github.com/mc-build/mc-build)

say piranha
scoreboard players set @s carrot.timer 0
execute if entity @s[scores={carrot.timer=0}] run tp @e[tag=hover3] @s
execute as @s at @s if entity @e[distance=..5,tag=!user,tag=!hover3,type=!armor_stand] run summon armor_stand ^ ^ ^3 {NoGravity:1b,Tags:["piran_stand"],Invisible:1b}
execute as @s at @s run playsound entity.zombie.hurt ambient @a ~ ~ ~ 1 2
execute as @s at @s run playsound entity.wither.shoot ambient @a ~ ~ ~ 0.3 1.5
execute as @e[tag=hover3] at @s positioned ^ ^2 ^ run function template:karbane_maw
scoreboard players set @s carrot.dmg 0