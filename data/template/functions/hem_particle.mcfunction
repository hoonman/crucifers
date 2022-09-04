#built using mc-build (https://github.com/mc-build/mc-build)

execute as @e[nbt={HurtTime:10s}] at @s run particle minecraft:block minecraft:redstone_wire ~ ~1.24 ~ 0.1 0.1 0.1 0.001 50 normal
tag @e[nbt={HurtTime:10s}] add hurt
scoreboard players set @e[tag=hurt, nbt={HurtTime:10s}] shakal.hemorrhage 0
execute as @e[nbt={HurtTime:10s}] at @s run function template:hem_bleeding
scoreboard players set @e shakal.hemorrhage 0