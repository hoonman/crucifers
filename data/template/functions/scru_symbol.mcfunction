#built using mc-build (https://github.com/mc-build/mc-build)

kill @e[tag=symbol]
execute as @s at @s run summon armor_stand ~ ~ ~ {Tags:["symbol"],NoGravity:1,Invisible:1b}
execute as @e[tag=symbol] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~90 ~
execute as @e[tag=symbol] run data modify entity @s Motion[0] set value 90.0f
execute as @e[tag=symbol] at @s facing ^0.1 ^ ^ positioned as @a[tag=user] positioned ^-1 ^2 ^ run function template:scrutinize_symbol
execute as @e[tag=symbol] at @s facing ^0.1 ^ ^ positioned as @a[tag=user] positioned ^-2 ^1 ^ run function template:scrutinize_symbol_medium
execute as @e[tag=symbol] at @s facing ^0.1 ^ ^ positioned as @a[tag=user] positioned ^-3 ^ ^ run function template:scrutinize_symbol_big
kill @e[tag=symbol]