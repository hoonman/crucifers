#built using mc-build (https://github.com/mc-build/mc-build)

say ragged
stopsound @a[tag=user] player minecraft:entity.player.attack.strong
stopsound @a[tag=user] player minecraft:entity.player.attack.crit
stopsound @a[tag=user] player minecraft:entity.player.attack.nodamage
stopsound @a[tag=user] player minecraft:entity.player.attack.weak
execute as @a[tag=user] unless entity @s[scores={feral.timer=..150}] run playsound entity.wither.shoot ambient @a ~ ~ ~ 1 2
execute as @a[tag=user] unless entity @s[scores={feral.timer=..150}] run playsound entity.player.attack.sweep ambient @a ~ ~ ~ 1 2
execute as @a[tag=user] unless entity @s[scores={feral.timer=150..}] run playsound entity.ender_dragon.growl ambient @a ~ ~ ~ 0.5 2
scoreboard players add @a[tag=user] werejix.ragged.attacked 1
execute as @e[tag=hover] if entity @a[tag=user,scores={werejix.ragged.attacked=1}] rotated as @a[tag=user] positioned ^ ^ ^4 run tp @s ~ ~ ~ ~25 ~
execute as @e[tag=hover] unless entity @a[scores={feral.timer=..150}] at @s positioned ^ ^2 ^-4 run function template:werejix_claw2
execute as @e[tag=hover] unless entity @a[scores={feral.timer=..150}] at @s positioned ^1 ^2 ^-4 run function template:werejix_claw2
execute as @e[tag=hover] unless entity @a[scores={feral.timer=..150}] at @s positioned ^-1 ^2 ^-4 run function template:werejix_claw2
execute as @e[tag=hover] unless entity @a[scores={feral.timer=150..}] at @s positioned ^ ^2 ^-4 run function template:werejix_claw3
execute as @e[tag=hover] unless entity @a[scores={feral.timer=150..}] at @s positioned ^1 ^2 ^-4 run function template:werejix_claw3
execute as @e[tag=hover] unless entity @a[scores={feral.timer=150..}] at @s positioned ^-1 ^2 ^-4 run function template:werejix_claw3
execute as @e[tag=!user,distance=..5,type=!armor_stand,team=!scrutinized,tag=!hurt,tag=!hover] at @s run function template:ragged_effect
execute as @e[tag=!user,distance=..4] at @s run tag @s add ragged
scoreboard players set @a werejix.ragged 0
execute as @a[tag=user,scores={werejix.ragged.attacked=2..}] run scoreboard players set @a[tag=user] werejix.ragged.attacked 0