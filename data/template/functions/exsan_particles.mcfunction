#built using mc-build (https://github.com/mc-build/mc-build)

execute as @s at @s run particle block redstone_block ~ ~ ~ 0.1 0.1 0.1 0.001 30 force
execute as @e[tag=user,scores={exsan.sound=..20}] unless entity @a[scores={exsan.sound=20}] run schedule function template:exsan_particles 2t replace