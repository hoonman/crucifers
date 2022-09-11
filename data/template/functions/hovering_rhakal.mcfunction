#built using mc-build (https://github.com/mc-build/mc-build)

scoreboard players add @a[tag=user] carrot.use 1
execute as @s at @s unless entity @e[tag=hover2] unless entity @a[tag=user,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] run summon ghast ^ ^ ^-1 {NoGravity:1b,Tags:["hover2"],NoAI:1b,Silent:1b,Attributes:[{Name:"generic.armor",Base:9999f},{Name:"generic.knockback_resistance",Base:1000f},{Name:"generic.max_health",Base:1024f}],ActiveEffects:[{Id:14,Amplifier:0,Duration:1000000,ShowParticles:false},{Id:11,Duration:10000,Amplifier:2,ShowParticles:0b}]}
execute as @e[tag=hover2] rotated as @a[tag=user] at @a[tag=user] positioned ^ ^ ^4 run tp @s ~ ~ ~ ~-40 ~
execute as @s[scores={carrot.use=..20}] run schedule function template:hovering_rhakal 0.1s replace
execute as @e[tag=!user,distance=..5] run team join noCollision @s
execute as @a[tag=user,scores={carrot.use=20..}] run scoreboard players set @s carrot.use 0
execute as @a[tag=user] if entity @a[tag=user,nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{CustomModelData:2002004}}}] run function template:disappear