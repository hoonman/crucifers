#built using mc-build (https://github.com/mc-build/mc-build)

effect give @s speed 1 10 false
execute if entity @s[scores={carrot.timer3=120..}] run scoreboard players set @s carrot.timer3 0
execute if entity @s[scores={sneak=0}] run scoreboard players set @s carrot.timer3 0
scoreboard players add @s carrot.timer3 1
execute as @s[scores={carrot.timer3=50..}] at @s run function template:havoc_effect
execute as @s[scores={carrot.timer3=0}] at @s run playsound entity.wither.hurt block @a ~ ~ ~ 1 0
execute as @s[scores={carrot.timer3=10}] at @s run playsound entity.wither.hurt block @a ~ ~ ~ 1 0
execute as @s[scores={carrot.timer3=20}] at @s run playsound entity.wither.hurt block @a ~ ~ ~ 1 0
execute as @s[scores={carrot.timer3=30}] at @s run playsound entity.wither.hurt block @a ~ ~ ~ 1 0
execute as @s[scores={carrot.timer3=40}] at @s run playsound entity.wither.hurt block @a ~ ~ ~ 1 0
execute as @s[scores={carrot.timer3=50}] at @s run playsound entity.wither.hurt block @a ~ ~ ~ 1 0