#built using mc-build (https://github.com/mc-build/mc-build)

say pound
playsound minecraft:entity.blaze.hurt ambient @a ~ ~ ~ 1 0
execute as @e[tag=!user,nbt={HurtTime:10s},limit=1,distance=..5] at @s run function template:pound_effect
scoreboard players set @s carrot.dmg 0