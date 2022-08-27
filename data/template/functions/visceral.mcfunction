#built using mc-build (https://github.com/mc-build/mc-build)

say visceral e
execute as @s at @s run summon armor_stand ~1 ~ ~-3 {Tags:["fin2"],Rotation:[90.0f,0.0f],NoGravity:1}
execute as @e[tag=fin2] positioned ^ ^ ^3 run function template:shakal_fin
kill @e[tag=fin2]
scoreboard players reset @e