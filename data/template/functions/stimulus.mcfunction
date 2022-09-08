#built using mc-build (https://github.com/mc-build/mc-build)

say stimulus
execute as @a[tag=user] run tag @s remove voluntary
execute as @e[tag=!user,distance=..5] run effect give @s wither 1 1 true
execute as @a[tag=user] run effect give @s speed 1 5 true
execute as @a[tag=user] run effect give @s invisibility 1 0 true
execute as @a[tag=user] run particle ash ~ ~ ~ 0.5 1 0.5 0 300
execute as @a[tag=user] run particle dust 0.62 0.62 0.145 1 ~ ~ ~ 0.2 1 0.2 0 50
execute as @e[nbt={HurtTime:10s},type=!armor_stand,tag=!user,team=!scrutinized,tag=!hurt] at @s rotated as @p run function template:apply_motion
execute as @a[tag=user,scores={sneak=0}] run tag @s add voluntary