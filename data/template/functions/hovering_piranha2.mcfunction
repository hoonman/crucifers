#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @s carrot.timer 1
scoreboard players add @e[tag=piran_stand] carrot.timer 1
execute as @s at @s unless entity @e[tag=hover4] unless entity @s[nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002006}}}] run summon ghast ^ ^ ^3 {NoGravity:1b,Tags:["hover4"],NoAI:1b,Silent:1b,Attributes:[{Name:"generic.armor",Base:9999f},{Name:"generic.knockback_resistance",Base:1000f},{Name:"generic.max_health",Base:500f}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:false},{Id:11,Amplifier:255,Duration:1000000,ShowParticles:false}]}
execute as @e[tag=piran_stand] at @s if entity @e[tag=!user,distance=..5] facing entity @e[limit=1,distance=..5,type=!armor_stand,tag=!user,tag=!hover4,sort=nearest] feet run tp @s ^0.5 ^ ^0.5
execute as @e[tag=hover4] rotated as @a[tag=user] at @a[tag=user] positioned ^ ^ ^4 if entity @a[scores={snowball.use=1..}] run tp @s ~ ~ ~ ~30 ~
execute as @e[tag=hover4] rotated as @a[tag=user] at @a[tag=user] positioned ^ ^ ^4 if entity @a[scores={snowball.use=0}] run tp @s ~ ~ ~ ~-30 ~
execute as @a[tag=snowball_used] run tag @s remove snowball_used
execute as @e[tag=piran_stand] at @s run effect give @e[type=!armor_stand,tag=!user,tag=!hover4,distance=..1] wither 1 1 true
execute as @e[nbt={HurtTime:10s},type=!armor_stand,tag=!user,team=!scrutinized,tag=!hurt,tag=!hover4] at @s rotated as @p run function template:apply_motion
execute as @e[tag=user,scores={carrot.timer=..20}] run schedule function template:hovering_piranha2 0.1s replace
execute as @e[tag=piran_stand] at @s run particle dust 0.404 0.063 0.62 1 ~ ~1 ~ 0 0 0 0 100
execute as @e[tag=piran_stand] at @s run playsound entity.zombie.hurt ambient @a ~ ~ ~ 1 2
execute as @e[tag=!user,distance=..5] run team join noCollision @s
execute as @e[tag=user,scores={carrot.timer=60..}] run scoreboard players set @s carrot.timer 0
execute as @e[tag=piran_stand,scores={carrot.timer=59},limit=1] run kill @e[tag=piran_stand,limit=1]
execute as @a[tag=user] if entity @a[tag=user,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002006}}}] if entity @e[tag=hover4] run function template:disappear_piranha2