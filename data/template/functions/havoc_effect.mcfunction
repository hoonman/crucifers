#built using mc-build (https://github.com/mc-build/mc-build)

say spin
execute as @a[tag=user,scores={carrot.timer3=50..85}] at @s run tp @s ~ ~ ~ ~30 ~1
execute as @a[tag=user,scores={carrot.timer3=85..120}] at @s run tp @s ~ ~ ~ ~30 ~-1
execute at @a[tag=user] as @e[tag=!user,tag=!hover4,type=!armor_stand,distance=..6] if entity @a[tag=user,scores={carrot.timer3=50..120}] run function template:havoc_damage
execute if entity @a[scores={sneak=0}] run scoreboard players set @s carrot.timer3 0
execute as @a[scores={carrot.timer3=50..120,sneak=1..}] at @s run schedule function template:havoc_effect 0.1s replace
execute as @e[tag=hover4] at @s positioned ^ ^2 ^-4 run function template:karbane_maw
execute as @a[tag=user] at @s run playsound entity.wither.hurt block @a ~ ~ ~ 1 2
execute as @a[tag=user] at @s run playsound entity.wither.shoot block @a ~ ~ ~ 0.5 2