#built using mc-build (https://github.com/mc-build/mc-build)

execute as @a[tag=user,scores={snowball.use=1..}] run kill @e[tag=hover2,limit=1,sort=furthest]
scoreboard players add @a[tag=user] carrot.timer2 1
execute as @a[tag=user] at @s unless entity @e[tag=hook] run summon armor_stand ~ ~ ~ {NoGravity:1b,Tags:["hook"],Invisible:1b}
execute as @e[tag=hook] at @s facing entity @e[distance=..20,limit=1,type=!armor_stand,tag=!user,sort=nearest,tag=!hover4,tag=!hover3] feet unless entity @e[distance=0,limit=1,type=!armor_stand,tag=!user,sort=nearest,tag=!hover4,tag=!hover3] run tp @s ^ ^ ^0.5 ~ ~
execute as @e[tag=hook] at @s if entity @a[scores={carrot.timer2=20..}] run kill @e[tag=hook2,sort=nearest,limit=1]
execute as @e[tag=hook] at @s facing entity @a[tag=user,scores={carrot.timer2=20..}] feet run tp @s ^ ^ ^0.01 ~ ~
execute as @e[type=!armor_stand,tag=!user,tag=!hover4,tag=!hover3,limit=1,sort=nearest] at @s facing entity @a[tag=user,scores={carrot.timer2=21..}] feet run tp @s ^ ^ ^0.5 ~ ~
execute as @e[tag=hook2] at @s facing entity @a[tag=user,scores={carrot.timer2=..100}] feet run tp @s ^ ^ ^0.01 ~ ~
execute as @a[tag=user,scores={carrot.timer2=..20}] at @e[tag=hook2,limit=1] run playsound entity.zombie.attack_iron_door ambient @a[tag=user] ~ ~ ~ 1 1
execute as @a[tag=user,scores={carrot.timer2=20}] at @e[tag=hook,limit=1] run playsound entity.zombie.attack_iron_door ambient @a[tag=user] ~ ~ ~ 1 0
execute as @e[tag=hook] at @s facing entity @e[distance=..20,limit=1,type=!armor_stand,tag=!user,sort=nearest,tag=!hover4,tag=!hover3] feet positioned ^ ^1 ^ unless entity @a[tag=user,scores={carrot.timer2=20..}] run function template:karbane_maw
execute as @e[tag=hook] at @s facing entity @e[distance=..20,limit=1,type=!armor_stand,tag=!user,sort=nearest,tag=!hover4,tag=!hover3] feet positioned ^ ^1 ^ unless entity @a[tag=user,distance=..1] unless entity @a[tag=user,scores={carrot.timer2=70..}] run particle witch ~ ~ ~ 0 0 0 0 1
execute as @e[tag=hook2] at @s facing entity @e[distance=..20,limit=1,type=!armor_stand,tag=!user,sort=nearest,tag=!hover4,tag=!hover3] feet positioned ^ ^1 ^ run particle witch ~ ~ ~ 0 0 0 0 5
execute as @e[tag=hook] at @s facing entity @e[distance=..20,limit=1,type=!armor_stand,tag=!user,sort=nearest,tag=!hover4,tag=!hover3] feet unless entity @e[distance=0,limit=1,type=!armor_stand,tag=!user,sort=nearest,tag=!hover4,tag=!hover3] unless entity @a[tag=user,scores={carrot.timer2=20..}] run summon armor_stand ~ ~ ~ {NoGravity:1b, Tags:["hook2"],Invisible:1b}
execute as @e[tag=!user,type=!armor_stand,limit=1,sort=nearest] at @s if entity @e[tag=hook,distance=..2] run effect give @s slowness 10 30 false
execute as @e[tag=!user,type=!armor_stand,limit=1,sort=nearest] at @s if entity @e[tag=hook,distance=..2] run tp @s ~ ~ ~
execute as @a[scores={carrot.timer2=..70}] unless entity @a[tag=user,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002006}}}] unless entity @e[distance=0,type=!armor_stand,tag=!user,tag=!hover4] run schedule function template:mawhook_timer 1t replace