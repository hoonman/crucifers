#built using mc-build (https://github.com/mc-build/mc-build)

say visceral v2
kill @e[tag=fin]
tag @s add user
scoreboard players add @s timer 1
execute if entity @s[scores={timer=20}] run tag @s add after
execute if entity @s[scores={timer=..20}] run tag @s remove after
execute as @s at @s run summon armor_stand ^ ^ ^1.8 {Tags:["fin"],NoGravity:1}
execute as @s at @s if entity @s[scores={timer=20}] run summon armor_stand ^ ^ ^3.3 {Tags:["fin"],NoGravity:1}
execute as @e[tag=fin] at @s rotated as @a[tag=user] run tp @s ~ ~ ~ ~ ~
execute as @s run function template:finandtag
playsound entity.wither.shoot ambient @s ~ ~ ~ 50 0
execute if entity @s[tag=after] run scoreboard players set @s shakal.visceral 0
tag @s remove user