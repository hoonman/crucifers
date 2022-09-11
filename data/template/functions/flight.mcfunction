#built using mc-build (https://github.com/mc-build/mc-build)

say flight
execute if entity @s[scores={flight.timer=100..}] run scoreboard players set @s flight.timer 0
scoreboard players add @s flight.timer 1
execute as @a[scores={sneak=0}] run scoreboard players set @s flight.timer 0
execute if entity @s[scores={flight.timer=20..}] as @a[tag=user] unless entity @s[scores={sneak=0}] run function template:flying