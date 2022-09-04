#built using mc-build (https://github.com/mc-build/mc-build)

say teleported
scoreboard players add @a[tag=user] skulls_timer 1
execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run tp @s ^ ^ ^1
execute at @e[tag=skulls2,limit=1] run playsound entity.zombie.hurt ambient @a[tag=user] ~ ~ ~ 1 0
execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..3] wither 1 2 true
execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..3] poison 1 3 false
execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run tp @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..3] ^ ^1 ^-2
execute as @e[tag=skulls2] at @s run particle dust 0.102 0.867 0.165 1 ~ ~ ~ 0.1 0.1 0.1 0.001 50 normal
say did it run till here?
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=4}] run spreadplayers ~ ~ 1 2 false @e[tag=skulls]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=8}] run spreadplayers ~ ~ 1 2 false @e[tag=skulls]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=12}] run spreadplayers ~ ~ 1 2 false @e[tag=skulls]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=16}] run spreadplayers ~ ~ 1 2 false @e[tag=skulls]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=20}] run spreadplayers ~ ~ 1 4 false @e[tag=skulls]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=24}] run spreadplayers ~ ~ 1 4 false @e[tag=skulls]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=28}] run spreadplayers ~ ~ 1 4 false @e[tag=skulls]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=32}] run spreadplayers ~ ~ 1 6 false @e[tag=skulls]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=38}] run spreadplayers ~ ~ 1 6 false @e[tag=skulls]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=42}] run spreadplayers ~ ~ 1 6 false @e[tag=skulls]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=49}] run tp @s @e[type=!armor_stand,tag=!user,limit=1,distance=..30]
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=80..}] run kill @s
execute as @e[tag=skulls2] at @s if entity @a[tag=user,scores={skulls_timer=80..}] run kill @s
say did it run till here? 2
execute as @e[tag=user,scores={skulls_timer=80..}] run scoreboard players set @s skulls_timer 0
say did it run till here? 3
execute if entity @s[scores={xyneth.skulls_clicked=2..}] run scoreboard players set @s skulls_timer 0
execute if entity @s[scores={xyneth.skulls_clicked=2..}] run scoreboard players set @s xyneth.skulls_clicked 1