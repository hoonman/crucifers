#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @s carrot.timer 1
execute as @s at @s unless entity @e[tag=hover2] unless entity @s[nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] run summon ghast ^ ^ ^3 {NoGravity:1b,Tags:["hover2"],NoAI:1b,Silent:1b,Attributes:[{Name:"generic.armor",Base:9999f},{Name:"generic.knockback_resistance",Base:1000f},{Name:"generic.max_health",Base:500f}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:false},{Id:11,Amplifier:255,Duration:1000000,ShowParticles:false}]}
execute as @e[tag=hover2] rotated as @a[tag=user] at @a[tag=user] positioned ^ ^ ^4 run tp @s ~ ~ ~ ~-40 ~
execute as @e[tag=user,scores={carrot.timer=..20}] run schedule function template:hovering_rhakal 0.1s replace
execute as @e[tag=!user,distance=..5] run team join noCollision @s
execute as @e[tag=user,scores={carrot.timer=120..}] run scoreboard players set @s carrot.timer 0
execute as @a[tag=user] if entity @a[tag=user,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] if entity @e[tag=hover2] run function template:disappear_rhakal