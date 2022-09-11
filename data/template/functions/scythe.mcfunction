#built using mc-build (https://github.com/mc-build/mc-build)

say scythe
tag @s add scythe
stopsound @s player minecraft:entity.player.attack.strong
stopsound @s player minecraft:entity.player.attack.crit
stopsound @s player minecraft:entity.player.attack.nodamage
stopsound @s player minecraft:entity.player.attack.weak
playsound entity.wither.shoot ambient @a ~ ~ ~ 1 0
execute as @e[tag=hover2] rotated as @a[tag=user] positioned ^ ^ ^1.5 run tp @s ~ ~ ~ ~35 ~
execute as @e[tag=hover2] at @s positioned ^ ^1 ^ unless entity @a[tag=user,scores={rhakal.sweep=1}] run function template:rhakal_fin_big3
execute as @e[tag=!user,distance=..6,type=!armor_stand,team=!scrutinized,tag=!hurt,tag=!hover2] at @s run function template:scythe_effect
execute as @e[tag=hover2] if entity @a[tag=user,scores={rhakal.sweep=1}] rotated as @a[tag=user] positioned ^ ^ ^ run function template:rhakal_fin_big2
scoreboard players add @s rhakal.sweep 1
execute as @a[tag=user,scores={rhakal.sweep=2..}] run scoreboard players set @a[tag=user] rhakal.sweep 0
tag @s remove scythe
scoreboard players set @s carrot.dmg 0