#built using mc-build (https://github.com/mc-build/mc-build)

stopsound @s player minecraft:entity.player.attack.strong
stopsound @s player minecraft:entity.player.attack.crit
execute as @s at @s run playsound minecraft:block.metal.break block @s
execute as @s at @s run function template:__generated__/block/0