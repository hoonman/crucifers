#built using mc-build (https://github.com/mc-build/mc-build)

kill @e[tag=symbol_exsan]
execute as @s at @s run summon armor_stand ~ ~ ~ {Tags:["symbol_exsan"],NoGravity:1,Invisible:1b}
execute as @e[tag=symbol_exsan] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
execute as @e[tag=symbol_exsan] run data modify entity @s Motion[0] set value 90.0f
execute as @e[tag=user] at @s positioned ^ ^0.5 ^ run function template:shakal_face_new
kill @e[tag=symbol_exsan]