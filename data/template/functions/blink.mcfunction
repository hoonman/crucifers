#built using mc-build (https://github.com/mc-build/mc-build)

say blink2
scoreboard players add @a[tag=user] carrot.use2 1
playsound entity.enderman.teleport ambient @a ~ ~ ~ 1 0
particle firework ~ ~ ~ 0 0 0 0 1
execute as @s at @s unless entity @s[scores={carrot.use2=10..}] run tp @s ^ ^0.01 ^1
execute as @a[tag=user] at @s unless entity @s[scores={carrot.use2=10..}] run function template:blink
execute as @a[scores={carrot.use2=10..}] run scoreboard players set @s carrot.use2 0