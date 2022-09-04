#built using mc-build (https://github.com/mc-build/mc-build)

kill @e[tag=symbol_exsan]
execute as @s at @s run summon armor_stand ~ ~ ~ {Tags:["symbol_exsan"],NoGravity:1,Invisible:1b}
execute as @e[tag=user] at @s positioned ^ ^0.5 ^ run function template:shakal_face_new
kill @e[tag=symbol_exsan]