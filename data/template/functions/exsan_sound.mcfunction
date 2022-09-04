#built using mc-build (https://github.com/mc-build/mc-build)

say hi
scoreboard players add @e[tag=user] exsan.sound 1
playsound minecraft:block.lava.pop voice @e[tag=user,type=player] ~ ~ ~ 50 0.3
execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4}] run effect give @s instant_damage 1 1
execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4}] run effect give @s instant_health 1 1
execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4}] run effect give @s instant_health 1 1
execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=4}] run effect give @s saturation 1 1
execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=8}] run effect give @s instant_damage 1 1
execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=8}] run effect give @s instant_health 1 1
execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=8}] run effect give @s instant_health 1 1
execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=8}] run effect give @s saturation 1 1
execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=16}] run effect give @s instant_damage 1 1
execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=16}] run effect give @s instant_health 1 1
execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=16}] run effect give @s instant_health 1 1
execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=16}] run effect give @s saturation 1 1
execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=24}] run effect give @s instant_damage 1 1
execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=24}] run effect give @s instant_health 1 1
execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=24}] run effect give @s instant_health 1 1
execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=24}] run effect give @s saturation 1 1
execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=32}] run effect give @s instant_damage 1 1
execute as @e[tag=!user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=32}] run effect give @s instant_health 1 1
execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=32}] run effect give @s instant_health 1 1
execute as @e[tag=user] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=32}] run effect give @s saturation 1 1
execute as @e[tag=exsan] at @s facing entity @a[tag=user] eyes if entity @a[tag=user,scores={exsan.sound=..60}] run tp @s ^ ^0.5 ^1
execute as @e[tag=exsan] at @s run particle block redstone_wire ~ ~ ~ 0.1 0.1 0.1 0.001 30 force
execute as @e[tag=user,scores={exsan.sound=..60}] unless entity @a[scores={exsan.sound=60}] run schedule function template:exsan_sound 0.1s replace
execute as @e[tag=user,scores={exsan.sound=60..}] run scoreboard players set @e[tag=user] exsan.sound 0