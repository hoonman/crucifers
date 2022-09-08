#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @a[tag=user] skulls_timer 1
execute as @e[tag=skulls2] at @s run particle dust 0.102 0.867 0.165 1 ~ ~-2 ~ 0.1 0.1 0.1 0.001 50 normal
execute as @e[tag=skulls4] at @s run particle dust 0.157 0.502 0.184 1 ~ ~-2 ~ 0.1 0.1 0.1 0.001 50 normal
execute as @e[tag=skulls6] at @s run particle dust 0.498 0.675 0.361 1 ~ ~-2 ~ 0.1 0.1 0.1 0.001 50 normal
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=..30}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user,sort=nearest] eyes run tp @s ^1 ^0.1 ^1
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=30..40}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user] eyes run tp @s ^1 ^ ^1
execute as @e[tag=skulls3] at @s if entity @a[tag=user,scores={skulls_timer=..30}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user,sort=nearest] eyes run tp @s ^-1 ^0.1 ^1
execute as @e[tag=skulls3] at @s if entity @a[tag=user,scores={skulls_timer=30..40}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user] eyes run tp @s ^1 ^ ^1
execute as @e[tag=skulls5] at @s if entity @a[tag=user,scores={skulls_timer=..30}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user,sort=nearest] eyes run tp @s ^ ^0.1 ^1
execute as @e[tag=skulls5] at @s if entity @a[tag=user,scores={skulls_timer=30..40}] facing entity @e[limit=1,distance=..30,type=!armor_stand,tag=!user] eyes run tp @s ^1 ^ ^1
execute as @e[nbt={HurtTime:10s},type=!armor_stand,tag=!user,team=!scrutinized,tag=!hurt] at @s rotated as @p run function template:apply_motion
execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] wither 1 7 true
execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] poison 1 7 false
execute as @e[tag=skulls4] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] wither 1 7 true
execute as @e[tag=skulls4] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] poison 1 7 false
execute as @e[tag=skulls6] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] wither 1 7 true
execute as @e[tag=skulls6] at @s facing entity @e[tag=skulls] eyes run effect give @e[tag=!skulls2,tag=!user,tag=!skulls,distance=..6] poison 1 7 false
execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls]
execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls2]
execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls3]
execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls4]
execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls5]
execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run kill @e[tag=skulls6]
execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run scoreboard players set @s xyneth.skulls_clicked 0
execute as @e[tag=user] at @s if entity @a[tag=user,scores={skulls_timer=40..}] run scoreboard players set @a[tag=user] skulls_timer 0
execute at @e[tag=skulls2,limit=1] run playsound entity.zombie.hurt ambient @a[tag=user] ~ ~ ~ 1 0
execute as @e[tag=skulls2] at @s facing entity @e[tag=skulls] eyes run tp @s ^ ^ ^1
execute as @e[tag=skulls4] at @s facing entity @e[tag=skulls3] eyes run tp @s ^ ^ ^1
execute as @e[tag=skulls6] at @s facing entity @e[tag=skulls5] eyes run tp @s ^ ^ ^1
execute as @e[tag=skulls] at @s if entity @a[tag=user,scores={skulls_timer=4}] run spreadplayers ~ ~ 1 2 false @e[tag=skulls]
execute as @e[tag=user,scores={skulls_timer=40..}] run scoreboard players set @s skulls_timer 0
execute if entity @s[scores={xyneth.skulls_clicked=2..}] run scoreboard players set @s skulls_timer 0
execute if entity @s[scores={xyneth.skulls_clicked=2..}] run scoreboard players set @s xyneth.skulls_clicked 1
execute if entity @s[scores={xyneth.skulls_clicked=2..}] run kill @e[tag=skulls]
execute if entity @s[scores={xyneth.skulls_clicked=2..}] run kill @e[tag=skulls2]