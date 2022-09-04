#built using mc-build (https://github.com/mc-build/mc-build)

say exsan effect
execute as @e[tag=!user,type=!arrow] at @s run summon armor_stand ~ ~0.1 ~ {Tags:["exsan"],ActiveEffects:[{Id:28,Duration:1000000,ShowParticles:true}]}
execute as @e[tag=!user,tag=exsan] at @s run function template:exsan_particles
execute as @e[tag=!user,tag=exsan] at @s rotated as @a[tag=user] facing entity @a[tag=user] eyes run tp @s ^ ^5 ^1