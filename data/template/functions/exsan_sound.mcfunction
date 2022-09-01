#built using mc-build (https://github.com/mc-build/mc-build)

say hi
scoreboard players add @e[tag=user] exsan.sound 1
playsound minecraft:block.lava.pop voice @e[tag=user,type=player] ~ ~ ~ 50 0.3
execute as @e[tag=user,scores={exsan.sound=..20}] unless entity @a[scores={exsan.sound=20}] run schedule function template:exsan_sound 0.1s replace
execute as @e[tag=user,scores={exsan.sound=20..}] run scoreboard players set @e[tag=user] exsan.sound 0